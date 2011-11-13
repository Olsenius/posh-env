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
    return "PS> "
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