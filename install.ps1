param([switch]$WhatIf = $false)

Import-Module .\utilities

Write-Host "Updating git submodules"
git submodule init
git submodule update

Write-Host "Building git-tfs"
C:\Windows\Microsoft.NET\Framework\v4.0.30319\msbuild.exe .\git-tfs\GitTfs.sln /p:Configuration=Vs2010_Debug

if($PSVersionTable.PSVersion.Major -lt 2) {
    Write-Warning "posh-git requires PowerShell 2.0 or better; you have version $($Host.Version)."
    return
}

if(!(Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Warning 'Could not find git command. Please create a git alias or add %ProgramFiles%\Git\cmd to PATH.'
    return
}

$installDir = Split-Path $MyInvocation.MyCommand.Path -Parent
if(!(. (Join-Path $installDir "posh-git\CheckVersion.ps1"))) {
    return
}

if(!(Test-Path $PROFILE)) {
    Write-Host "Creating PowerShell profile...`n$PROFILE"
    New-Item $PROFILE -Force -Type File -ErrorAction Stop -WhatIf:$WhatIf > $null
}

$profileLine = ". '$installDir\profile.ps1'"

Write-Host "Adding posh-env to profile..."
@"

# Load posh-env profile
$profileLine

"@ | Out-File $PROFILE -WhatIf:$WhatIf -Encoding (Get-FileEncoding $PROFILE)

Write-Host 'posh-env sucessfully installed!'
Write-Host 'Please reload your profile for the changes to take effect:'
Write-Host '    . $PROFILE'
