<#
.SYNOPSIS
    在「游戏里的模组目录」和「本仓库的 mod\ 目录」之间同步文件。

.DESCRIPTION
    游戏目录才是你实际在玩、实际在改的那份；仓库里的 mod\ 是它的镜像，
    用来做版本记录和回滚。

    - 默认动作：游戏目录 -> 仓库，把改动收进 mod\，可用 -Commit 顺便提交。
    - -ToGame：仓库 -> 游戏目录，把仓库里的版本还原回去（还原前自动备份）。
    - -Check：只用哈希比较两边差异，不复制任何文件。

.EXAMPLE
    # 看看两边差在哪
    pwsh -File .\sync-mod.ps1 -ModDir "D:\...\mods\[DST]Magic Cat" -Check

.EXAMPLE
    # 改完代码，同步进仓库并提交
    pwsh -File .\sync-mod.ps1 -ModDir "D:\...\mods\[DST]Magic Cat" -Commit -Message "修复猫爪技能冷却"

.EXAMPLE
    # 改坏了，把仓库里的版本还原回游戏目录（先自动备份当前文件）
    pwsh -File .\sync-mod.ps1 -ModDir "D:\...\mods\[DST]Magic Cat" -ToGame
#>
param(
    # 游戏中的模组目录（必填，或改这里的默认值）
    [string]$ModDir = "",
    # 仓库里的镜像目录，默认是脚本同级的 mod\
    [string]$RepoMod = "",
    # 仓库 -> 游戏目录
    [switch]$ToGame,
    # 只比较，不复制
    [switch]$Check,
    # 同步进仓库后自动 git add + commit
    [switch]$Commit,
    # 提交信息
    [string]$Message = ""
)

$ErrorActionPreference = 'Stop'

if (-not $RepoMod) { $RepoMod = Join-Path $PSScriptRoot 'mod' }
if (-not $ModDir) { throw '请用 -ModDir 指定游戏里的模组目录，例如 -ModDir "D:\Steam\steamapps\common\Don''t Starve Together\mods\[DST]Magic Cat"' }

# ---------- 0. 基本检查 ----------
if (-not (Test-Path -LiteralPath $ModDir)) { throw "模组目录不存在: $ModDir" }
if (-not (Test-Path -LiteralPath (Join-Path $ModDir 'modinfo.lua'))) { throw "这个目录不像模组（缺少 modinfo.lua）: $ModDir" }
if (-not (Test-Path -LiteralPath $RepoMod)) { throw "仓库镜像目录不存在: $RepoMod（先把仓库 clone 下来，或手动建好 mod\）" }

$excludeFiles = @('*.bak', '*.log')
$excludeDirs = @('.git')

function Copy-Tree {
    param([string]$From, [string]$To, [switch]$ListOnly)
    $rcArgs = @($From, $To, '/MIR', '/R:1', '/W:1', '/NP', '/NFL', '/NDL', '/NJH', '/NJS', '/XF') + $excludeFiles + @('/XD') + $excludeDirs
    if ($ListOnly) { $rcArgs += '/L' }
    robocopy @rcArgs | Out-Null
    if ($LASTEXITCODE -ge 8) { throw "复制失败，robocopy 退出码 $LASTEXITCODE（$From -> $To）" }
    return $LASTEXITCODE
}

function Get-Manifest {
    param([string]$Root)
    $rootPath = (Resolve-Path -LiteralPath $Root).Path.TrimEnd('\')
    $map = @{}
    Get-ChildItem -LiteralPath $rootPath -Recurse -File -Force | Where-Object {
        $_.Extension -notin @('.bak', '.log') -and $_.FullName -notmatch '\\\.git\\'
    } | ForEach-Object {
        $rel = $_.FullName.Substring($rootPath.Length).TrimStart('\')
        $map[$rel] = (Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash
    }
    return $map
}

# ---------- 1. 只比较 ----------
if ($Check) {
    Write-Output '== 比较：游戏目录 vs 仓库镜像（SHA256）=='
    $game = Get-Manifest -Root $ModDir
    $repo = Get-Manifest -Root $RepoMod

    $gameUpdates = @()
    foreach ($k in $game.Keys) {
        if (-not $repo.ContainsKey($k)) { $gameUpdates += "新增  $k" }
        elseif ($repo[$k] -ne $game[$k]) { $gameUpdates += "修改  $k" }
    }
    $repoOnly = @()
    foreach ($k in $repo.Keys) {
        if (-not $game.ContainsKey($k)) { $repoOnly += "多余  $k" }
    }

    if (-not $gameUpdates -and -not $repoOnly) { Write-Output '两边完全一致。' }
    else {
        if ($gameUpdates) {
            Write-Output ("-- 游戏目录更新（同步进仓库会带上）: {0} 项" -f $gameUpdates.Count)
            $gameUpdates | Select-Object -First 20 | ForEach-Object { Write-Output ('   ' + $_) }
            if ($gameUpdates.Count -gt 20) { Write-Output ("   ... 其余 {0} 项" -f ($gameUpdates.Count - 20)) }
        }
        if ($repoOnly) {
            Write-Output ("-- 仓库里有、游戏目录没有（游戏里删掉了，用 -ToGame 会补回来）: {0} 项" -f $repoOnly.Count)
            $repoOnly | Select-Object -First 20 | ForEach-Object { Write-Output ('   ' + $_) }
        }
    }
    return
}

# ---------- 2. 仓库 -> 游戏 ----------
if ($ToGame) {
    $stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
    $backup = "$ModDir-backup-$stamp"
    Write-Output '== 还原：仓库 -> 游戏目录 =='
    Write-Output "先把当前游戏文件备份到: $backup"
    Copy-Tree -From $ModDir -To $backup | Out-Null
    $code = Copy-Tree -From $RepoMod -To $ModDir
    Write-Output ("完成（robocopy 退出码 {0}）。备份在 {1}，确认没问题后可自行删除。" -f $code, $backup)
    return
}

# ---------- 3. 游戏 -> 仓库 ----------
Write-Output '== 同步：游戏目录 -> 仓库 =='
$code = Copy-Tree -From $ModDir -To $RepoMod
Write-Output ("镜像完成（robocopy 退出码 {0}）" -f $code)

if (-not $Commit) {
    Write-Output '下一步：git add mod 并提交；或者下次加 -Commit -Message "..." 一步到位。'
    return
}

# ---------- 4. 可选提交 ----------
$git = (Get-Command git -ErrorAction SilentlyContinue).Source
if (-not $git) {
    $candidate = Join-Path $env:ProgramFiles 'Git\cmd\git.exe'
    if (Test-Path -LiteralPath $candidate) { $git = $candidate }
}
if (-not $git) { throw '找不到 git，请先安装或把 Git 加入 PATH。' }

if (-not $Message) { $Message = '同步模组代码 ' + (Get-Date -Format 'yyyy-MM-dd HH:mm:ss') }

Push-Location $PSScriptRoot
try {
    & $git add -- mod
    $staged = @(& $git diff --cached --name-only -- mod)
    if ($staged.Count -eq 0) {
        Write-Output '仓库里没有变化，未提交。'
    }
    else {
        & $git commit -q -m $Message
        Write-Output ("已提交 {0} 个文件：{1}" -f $staged.Count, $Message)
        Write-Output '推送到 GitHub：git push'
    }
}
finally {
    Pop-Location
}
