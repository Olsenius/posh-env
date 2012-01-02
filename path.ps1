function Update-RelativePath($childPath) {
    $path = Get-Location | Join-Path -ChildPath $childPath
    $env:Path += ";" + $path	
}

if(Test-Win64 -eq $true) {
    Update-RelativePath("curl\win64"
    Update-RelativePath("${env:ProgramFiles(x86)}\git\bin")

}
else {
	Update-RelativePath("curl\win32")
        Update-RelativePath("${env:ProgramFiles}\git\bin")
}

Update-RelativePath("nuget")
Update-RelativePath("nodejs")
Update-RelativePath("git-tfs\GitTfs\bin\Debug")
