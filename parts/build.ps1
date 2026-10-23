<#
.SYNOPSIS
    把 parts/ 下的台词分片按顺序拼装成 speech_madeleine.lua。

.DESCRIPTION
    - 只读分片、源台词文件，输出一个 UTF-8 无 BOM、LF 换行的 Lua 文件。
    - 需要指定模组目录（-ModDir），也可用 -Source/-Doc1/-OutFile 逐个覆盖。

.EXAMPLE
    pwsh -File parts\build.ps1 -ModDir "X:\SteamLibrary\steamapps\common\Don't Starve Together\mods\你的模组" -DryRun

.EXAMPLE
    pwsh -File parts\build.ps1 -ModDir "X:\SteamLibrary\steamapps\common\Don't Starve Together\mods\你的模组"
#>
param(
    # 分片所在目录，默认就是本脚本所在目录
    [string]$PartsDir = $PSScriptRoot,
    # 模组根目录（其下应有 scripts\）；给了它就不必再写下面三个路径
    [string]$ModDir = "",
    # 源台词文件（对照用，通常是 speech_wilson.lua）
    [string]$Source = "",
    # 现有的 speech_madeleine.lua（用于检查是否丢键）
    [string]$Doc1 = "",
    # 输出文件；默认写到 <ModDir>\scripts\speech_madeleine.lua
    [string]$OutFile = "",
    # 只分析不写入游戏目录，预览文件写到系统临时目录
    [switch]$DryRun
)

$ErrorActionPreference = 'Stop'

# ---------- 0. 解析路径 ----------
$scriptsDir = if ($ModDir) { Join-Path $ModDir 'scripts' } else { '' }

if (-not $Source) {
    if ($ModDir) { $Source = Join-Path $scriptsDir 'speech_wilson.lua' }
    else { throw '请指定 -ModDir（模组根目录）或 -Source（源台词文件路径）。' }
}
if (-not $Doc1 -and $ModDir) { $Doc1 = Join-Path $scriptsDir 'speech_madeleine.lua' }
if (-not $OutFile) {
    if ($DryRun) { $OutFile = $Doc1 }
    elseif ($ModDir) { $OutFile = Join-Path $scriptsDir 'speech_madeleine.lua' }
    else { throw '请指定 -ModDir（模组根目录）或 -OutFile（输出文件路径）。' }
}

if (-not (Test-Path -LiteralPath $PartsDir)) { throw "分片目录不存在: $PartsDir" }
if (-not (Test-Path -LiteralPath $Source)) { throw "源台词文件不存在: $Source（用 -ModDir 或 -Source 指定）" }

$order = @('_HEAD.lua','H1.lua','H2.lua','H3.lua','__DESCRIBE__','D1.lua','D2.lua','D3.lua','D4.lua','D5.lua','D6.lua','D7.lua','D8.lua','D9.lua','D10.lua','D11.lua','_TAIL.lua')

$expectedFirst = @{
    'H1.lua'  = 'ACTIONFAIL'
    'H2.lua'  = 'ANNOUNCE_CANNOT_BUILD'
    'H3.lua'  = 'ANNOUNCE_WX_SCANNER_NEW_FOUND'
    'D1.lua'  = 'MULTIPLAYER_PORTAL'
    'D2.lua'  = 'MUSHROOM_LIGHT'
    'D3.lua'  = 'COOKPOT'
    'D4.lua'  = 'MOOSE_NESTING_GROUND'
    'D5.lua'  = 'HALLOWEEN_ORNAMENT_1'
    'D6.lua'  = 'QUAGMIRE_TOMATO'
    'D7.lua'  = 'OCEANFISHINGBOBBER_ROBIN_WINTER'
    'D8.lua'  = 'MOON_ALTAR_LINK'
    'D9.lua'  = 'EYEMASKHAT'
    'D10.lua' = 'YOTD_DRAGONSHRINE'
    'D11.lua' = 'MOON_TREE_BLOSSOM_DRIED'
}

function Read-Part([string]$name) {
    $p = Join-Path $PartsDir $name
    if (-not (Test-Path -LiteralPath $p)) { throw "缺少分块: $name" }
    $t = [System.IO.File]::ReadAllText($p, [System.Text.Encoding]::UTF8)
    $t = $t.TrimStart([char]0xFEFF)
    $t = $t -replace "`r`n", "`n"
    $t = $t -replace "`r", "`n"
    $lines = $t -split "`n"
    # 去掉文件首尾的空行
    $start = 0
    while ($start -lt $lines.Count -and $lines[$start].Trim() -eq '') { $start++ }
    $end = $lines.Count - 1
    while ($end -ge 0 -and $lines[$end].Trim() -eq '') { $end-- }
    if ($end -lt $start) { throw "分块为空: $name" }
    return ($lines[$start..$end] -join "`n")
}

# ---------- 1. 收集分块 ----------
$chunks = @()
foreach ($name in $order) {
    if ($name -eq '__DESCRIBE__') {
        $chunks += "`tDESCRIBE =`n`t{"
        continue
    }
    $text = Read-Part $name
    if ($expectedFirst.ContainsKey($name)) {
        $firstKey = ($text -split "`n")[0].Trim() -replace '\s*=.*',''
        if ($firstKey -ne $expectedFirst[$name]) {
            Write-Output ("WARN 分块起始键不符 {0}: 期望 {1} 实际 {2}" -f $name, $expectedFirst[$name], $firstKey)
        }
    }
    $chunks += $text
}
$body = $chunks -join "`n`n"
$body = $body + "`n"

# ---------- 2. 括号/引号配平 ----------
function Test-Balance([string]$text, [string]$label) {
    $d = 0; $inStr = $false; $q = [char]0; $minDepth = 0
    $lines = $text -split "`n"
    for ($i = 0; $i -lt $lines.Count; $i++) {
        $l = $lines[$i]
        for ($j = 0; $j -lt $l.Length; $j++) {
            $c = $l[$j]
            if ($inStr) {
                if ($c -eq '\') { $j++; continue }
                if ($c -eq $q) { $inStr = $false }
                continue
            }
            if ($c -eq '-' -and $j + 1 -lt $l.Length -and $l[$j + 1] -eq '-') { break }
            if ($c -eq '"' -or $c -eq "'") { $inStr = $true; $q = $c; continue }
            if ($c -eq '{') { $d++ }
            elseif ($c -eq '}') { $d--; if ($d -lt $minDepth) { $minDepth = $d } }
        }
        if ($inStr -and ($i % 1 -eq 0)) {
            # 字符串未在本行闭合 -> 只报告，不中断（源文件里没有跨行字符串）
        }
    }
    Write-Output ("BALANCE {0}: depth_end={1} min_depth={2} unclosed_string={3}" -f $label, $d, $minDepth, $inStr)
}

# 注意：本文件（含 head/tail）整体应当配平，depth 结束于 0
$full = $body
Test-Balance $full "assembled"

# ---------- 3. 结构比对 ----------
function Get-KeySeq([string]$text) {
    $seq = New-Object System.Collections.Generic.List[string]
    foreach ($l in ($text -split "`n")) {
        $t = $l.Trim()
        if ($t -eq '' -or $t.StartsWith('--')) { continue }
        if ($t -match '^([A-Za-z0-9_]+)\s*=') { $seq.Add($matches[1]) }
        elseif ($t.StartsWith('"')) { $seq.Add('@str') }
    }
    return $seq
}

$srcText = ([System.IO.File]::ReadAllText($Source, [System.Text.Encoding]::UTF8)) -replace "`r`n", "`n"
$srcSeq = Get-KeySeq $srcText
$outSeq = Get-KeySeq $full

Write-Output ("SEQ src={0} out={1}" -f $srcSeq.Count, $outSeq.Count)

# 多重集比较：以源文件为准，报告缺失/多余（对插入删除不敏感）
$srcCount = @{}
foreach ($k in $srcSeq) { if ($srcCount.ContainsKey($k)) { $srcCount[$k]++ } else { $srcCount[$k] = 1 } }
$outCount = @{}
foreach ($k in $outSeq) { if ($outCount.ContainsKey($k)) { $outCount[$k]++ } else { $outCount[$k] = 1 } }

$missing = @()
$extra = @()
foreach ($k in $srcCount.Keys) {
    $o = if ($outCount.ContainsKey($k)) { $outCount[$k] } else { 0 }
    if ($o -lt $srcCount[$k]) { $missing += ("{0} (-{1})" -f $k, ($srcCount[$k] - $o)) }
}
foreach ($k in $outCount.Keys) {
    $s = if ($srcCount.ContainsKey($k)) { $srcCount[$k] } else { 0 }
    if ($outCount[$k] -gt $s) { $extra += ("{0} (+{1})" -f $k, ($outCount[$k] - $s)) }
}
Write-Output ("MISSING_KEYS={0} :: {1}" -f $missing.Count, (($missing | Select-Object -First 40) -join ', '))
Write-Output ("EXTRA_KEYS={0} :: {1}" -f $extra.Count, (($extra | Select-Object -First 40) -join ', '))

# 原 speech_madeleine.lua 里已有、但新文件丢失的键（补全不应丢功能）
if ($Doc1 -and (Test-Path -LiteralPath $Doc1)) {
    $doc1Text = ([System.IO.File]::ReadAllText($Doc1, [System.Text.Encoding]::UTF8)) -replace "`r`n", "`n"
    $doc1Seq = Get-KeySeq $doc1Text
    $lost = @()
    foreach ($k in ($doc1Seq | Sort-Object -Unique)) {
        if (-not $outCount.ContainsKey($k)) { $lost += $k }
    }
    Write-Output ("LOST_FROM_DOC1={0} :: {1}" -f $lost.Count, ($lost -join ', '))
}
else {
    Write-Output "LOST_FROM_DOC1=skipped（未提供 -Doc1，或文件不存在）"
}

# 备注数量
$srcComments = ([regex]::Matches($srcText, '--\S')).Count
$outComments = ([regex]::Matches($full, '--\S')).Count
Write-Output ("COMMENTS src={0} out={1}" -f $srcComments, $outComments)

# 未翻译的英文残留
$eng = @()
foreach ($l in ($full -split "`n")) {
    $t = $l.Trim()
    if ($t.StartsWith('--')) { continue }
    foreach ($m in [regex]::Matches($l, '"((?:[^"\\]|\\.)*)"')) {
        $v = $m.Groups[1].Value
        $clean = $v -replace '%[sd]', '' -replace '\{[a-zA-Z_]+\}', ''
        if ($clean -match '[A-Za-z]{2,}' -and $clean -notmatch '[\u4e00-\u9fa5]') {
            $eng += $t
            break
        }
    }
}
Write-Output ("ENGLISH_LEFTOVER_LINES={0}" -f $eng.Count)
$eng | Select-Object -First 20 | ForEach-Object { Write-Output ("  " + $_) }

# ---------- 4. 写入 ----------
if ($DryRun) {
    $preview = Join-Path ([System.IO.Path]::GetTempPath()) 'speech_madeleine.preview.lua'
    [System.IO.File]::WriteAllText($preview, $full, (New-Object System.Text.UTF8Encoding($false)))
    Write-Output ("DRYRUN: 未写入游戏目录；预览已写入 {0}（lines={1}）" -f $preview, (($full -split "`n").Count))
} else {
    $enc = New-Object System.Text.UTF8Encoding($false)
    if (Test-Path -LiteralPath $OutFile) {
        $bak = $OutFile + ".bak"
        if (-not (Test-Path -LiteralPath $bak)) { Copy-Item -LiteralPath $OutFile -Destination $bak -Force }
        Write-Output ("BACKUP {0}" -f $bak)
    }
    [System.IO.File]::WriteAllText($OutFile, $full, $enc)
    Write-Output ("WROTE {0} bytes={1} lines={2}" -f $OutFile, $full.Length, (($full -split "`n").Count))
    Write-Output "--- 首 6 行 ---"
    ($full -split "`n")[0..5] | ForEach-Object { Write-Output ("|" + $_) }
    Write-Output "--- 末 6 行 ---"
    $all = $full -split "`n"
    $all[($all.Count-7)..($all.Count-1)] | ForEach-Object { Write-Output ("|" + $_) }
}
