function Set-VsVars($bat = "vsvars32.bat") {
    $comntools = (Get-ChildItem env:VS100COMNTOOLS).Value
    $batchFile = Join-Path $comntools $bat
    
    $cmd = "`"$batchFile`" & set"
    cmd /c $cmd | Foreach-Object {
        $p, $v = $_.split('=')
        Set-Item -path env:$p -value $v
    }
    
    [System.Console]::Title = "Visual Studio 2010 Windows PowerShell"
}