function Update-RelativePath($childPath) {
    $path = Get-Location | Join-Path -ChildPath $childPath
    $env:Path += ";" + $path	
}

if(Test-Win64 -eq $true) {
    Update-RelativePath("curl\win64")
}
else {
	Update-RelativePath("curl\win32")
}

Update-RelativePath("nuget")
Update-RelativePath("git-tfs\GitTfs\bin\Debug")
