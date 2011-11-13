$nugetPath = Join-Path Get-Location "nuget"
$gitTfsPath = Join-Path Get-Location "git-tfs\GitTfs\bin\Debug"
$curlPath = Join-Path Get-Location "curl\win32"
if(Test-Win64 -eq $true) {
    $curlPath = Join-Path Get-Location "curl\win64"
}

$env:Path += ";" + $gitTfsPath + ";" + $curlPath + ";" + $nugetPath
