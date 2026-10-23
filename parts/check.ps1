<#
.SYNOPSIS
    校验拼装结果：引号配对、占位符数量、括号深度、行数。

.EXAMPLE
    pwsh -File parts\check.ps1 -ModDir "D:\Game\Steam\steamapps\common\Don't Starve Together\mods\[DST]Magic Cat"
#>
param(
    # 模组根目录（其下应有 scripts\）
    [string]$ModDir = "",
    # 待校验的台词文件；默认 <ModDir>\scripts\speech_madeleine.lua
    [string]$OutFile = "",
    # 源台词文件；默认 <ModDir>\scripts\speech_wilson.lua
    [string]$Source = ""
)
$ErrorActionPreference = 'Stop'

$scriptsDir = if ($ModDir) { Join-Path $ModDir 'scripts' } else { '' }
if (-not $OutFile) {
    if ($ModDir) { $OutFile = Join-Path $scriptsDir 'speech_madeleine.lua' }
    else { throw '请指定 -ModDir（模组根目录）或 -OutFile（台词文件路径）。' }
}
if (-not $Source) {
    if ($ModDir) { $Source = Join-Path $scriptsDir 'speech_wilson.lua' }
    else { throw '请指定 -ModDir（模组根目录）或 -Source（源台词文件路径）。' }
}
foreach ($f in @($OutFile, $Source)) {
    if (-not (Test-Path -LiteralPath $f)) { throw "文件不存在: $f" }
}

function Get-Lines([string]$path) {
    $t = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
    $t = $t.TrimStart([char]0xFEFF) -replace "`r`n", "`n" -replace "`r", "`n"
    return ,($t -split "`n")
}
$out = Get-Lines $OutFile
$src = Get-Lines $Source

# 1) 逐行引号奇偶（去注释后）
function Get-Code([string]$line) {
    $inStr = $false; $q = [char]0
    for ($j = 0; $j -lt $line.Length; $j++) {
        $c = $line[$j]
        if ($inStr) {
            if ($c -eq '\') { $j++; continue }
            if ($c -eq $q) { $inStr = $false }
            continue
        }
        if ($c -eq '-' -and $j + 1 -lt $line.Length -and $line[$j + 1] -eq '-') { return $line.Substring(0, $j) }
        if ($c -eq '"' -or $c -eq "'") { $inStr = $true; $q = $c; continue }
    }
    return $line
}

$badQuotes = @()
$badTail = @()
$noString = @()
for ($i = 0; $i -lt $out.Count; $i++) {
    $code = (Get-Code $out[$i]).TrimEnd()
    if ($code.Trim() -eq '') { continue }
    $dbl = ([regex]::Matches($code, '(?<!\\)"')).Count
    if ($dbl % 2 -ne 0) { $badQuotes += ($i + 1) }
    if ($code -match '=\s*$') { continue }           # 值是表，下一行是 {
    if ($code -match '=\s*"') {
        if (-not ($code -match '",\s*$' -or $code -match '"\s*$')) { $badTail += ("{0}: {1}" -f ($i + 1), $code) }
    }
    if ($code.Trim() -match '^[A-Za-z0-9_]+\s*=' -and $code -notmatch '"' -and $code -notmatch '=\s*$' -and $code.Trim() -notmatch '^[A-Za-z0-9_]+\s*=\s*\{') {
        $noString += ("{0}: {1}" -f ($i + 1), $code)
    }
}
Write-Output ("CHECK 引号奇数行={0} :: {1}" -f $badQuotes.Count, (($badQuotes | Select-Object -First 10) -join ','))
Write-Output ("CHECK 条目行结尾异常={0}" -f $badTail.Count)
$badTail | Select-Object -First 10 | ForEach-Object { Write-Output ("  " + $_) }
Write-Output ("CHECK 键=值但没有字符串的行={0}" -f $noString.Count)
$noString | Select-Object -First 10 | ForEach-Object { Write-Output ("  " + $_) }

# 2) 占位符计数
foreach ($ph in @('%s', '%d', '{weight}', '{name}', '{day}', '{owner}', '\n', '%1')) {
    $so = ([regex]::Matches(($out -join "`n"), [regex]::Escape($ph))).Count
    $ss = ([regex]::Matches(($src -join "`n"), [regex]::Escape($ph))).Count
    Write-Output ("PLACEHOLDER {0}: src={1} out={2}" -f $ph, $ss, $so)
}

# 3) 全角引号做分隔符的嫌疑行（键 = “...”）
$fw = 0
for ($i = 0; $i -lt $out.Count; $i++) {
    $code = (Get-Code $out[$i]).Trim()
    if ($code -match '=\s*[\u201c\u201d]') { $fw++; if ($fw -le 5) { Write-Output ("  FW {0}: {1}" -f ($i + 1), $code) } }
}
Write-Output ("CHECK 全角引号当分隔符={0}" -f $fw)

# 4) 结构：花括号深度与数组元素行
$depthEnd = 0; $inStr = $false; $q = [char]0; $minD = 0
foreach ($l in $out) {
    for ($j = 0; $j -lt $l.Length; $j++) {
        $c = $l[$j]
        if ($inStr) { if ($c -eq '\') { $j++; continue }; if ($c -eq $q) { $inStr = $false }; continue }
        if ($c -eq '-' -and $j + 1 -lt $l.Length -and $l[$j + 1] -eq '-') { break }
        if ($c -eq '"' -or $c -eq "'") { $inStr = $true; $q = $c; continue }
        if ($c -eq '{') { $depthEnd++ } elseif ($c -eq '}') { $depthEnd--; if ($depthEnd -lt $minD) { $minD = $depthEnd } }
    }
}
Write-Output ("CHECK 括号 depth_end={0} min={1}" -f $depthEnd, $minD)

# 5) 结论
Write-Output ("LINES out={0} src={1}" -f $out.Count, $src.Count)
Write-Output ("CHARS out={0}" -f (($out -join "`n").Length))
