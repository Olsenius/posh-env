Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)

Import-Module .\utilities
Import-Module .\Pscx\Pscx
Import-Module .\posh-git\posh-git
Import-Module .\vs-vars

. .\git-config.ps1
. .\path.ps1
. .\prompt.ps1

Enable-GitColors
Start-SshAgent -Quiet
Set-VsVars

Pop-Location
