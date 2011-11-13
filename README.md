posh-env
========

Installing
----------
Verify you have PowerShell 2.0 or better with $PSVersionTable.PSVersion

Verify execution of scripts is allowed with Get-ExecutionPolicy (should be RemoteSigned or Unrestricted). If scripts are not enabled, run PowerShell as Administrator and call Set-ExecutionPolicy RemoteSigned -Confirm.

Verify that git can be run from PowerShell. If the command is not found, you will need to add a git alias or add %ProgramFiles%\Git\cmd to your PATH environment variable.

Clone the posh-env repository to your local machine.

Edit the git-config.psm1

From the posh-env repository directory, run .\install.ps1.

License
-------
http://thedersen.mit-license.org/