Push-Location (Split-Path -Path $MyInvocation.MyCommand.Definition -Parent)

# Load PowerShell Community Extensions module
Import-Module .\Pscx\Pscx

# Load posh-git module 
Import-Module .\posh-git\posh-git

# Load git configuration settings module
Import-Module .\git-config

# Set up a simple prompt, adding the git prompt parts inside git repos
function prompt {
    $realLASTEXITCODE = $LASTEXITCODE

	Write-Host
	
    # Reset color, which can be messed up by Enable-GitColors
    $Host.UI.RawUI.ForegroundColor = $GitPromptSettings.DefaultForegroundColor

    Write-Host($pwd) -nonewline
        
    # Git Prompt
    $Global:GitStatus = Get-GitStatus
    Write-GitStatus $GitStatus

	Write-Host
    $LASTEXITCODE = $realLASTEXITCODE
    return "> "
}

$teBackup = 'posh-git_DefaultTabExpansion'
if(!(Test-Path Function:\$teBackup)) {
    Rename-Item Function:\TabExpansion $teBackup
}

# Set up tab expansion and include git expansion
function TabExpansion($line, $lastWord) {
    $lastBlock = [regex]::Split($line, '[|;]')[-1].TrimStart()
    switch -regex ($lastBlock) {
        # Execute git tab completion for all git-related commands
        "$(Get-GitAliasPattern) (.*)" { GitTabExpansion $lastBlock }
        # Fall back on existing tab expansion
        default { & $teBackup $line $lastWord }
    }
}

Enable-GitColors

Pop-Location

Start-SshAgent -Quiet

# Load VS stuff
function Get-Batchfile ($file) {
    $cmd = "`"$file`" & set"
    cmd /c $cmd | Foreach-Object {
        $p, $v = $_.split('=')
        Set-Item -path env:$p -value $v
    }
}

function VsVars($bat)
{
    $comntools = (Get-ChildItem env:VS100COMNTOOLS).Value
    $batchFile = Join-Path $comntools $bat
    Get-Batchfile $BatchFile
    
    [System.Console]::Title = "Visual Studio 2010 Windows PowerShell"
}

VsVars "vsvars32.bat"

$Processor = Get-WmiObject Win32_Processor | where {$_.DeviceID -eq "CPU0"} | select AddressWidth
$win64 = $Processor.AddressWidth -eq 64

# Update the path variable
$currentDir = Split-Path $MyInvocation.MyCommand.Path -Parent

$nugetPath = Join-Path $currentDir "nuget"
$gitTfsPath = Join-Path $currentDir "git-tfs\GitTfs\bin\Debug"
$curlPath = Join-Path $currentDir "curl\win32"
if($win64) {
    $curlPath = Join-Path $currentDir "curl\win64"
}

$env:Path += ";" + $gitTfsPath + ";" + $curlPath + ";" + $nugetPath
