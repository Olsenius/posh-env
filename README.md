posh-env
========
This repo contains various command line stuff that I use when working on a Windows box:

* [git-tfs](https://github.com/spraints/git-tfs)
* [posh-git](https://github.com/dahlbyk/posh-git)
* [curl](http://curl.haxx.se/)
* [pscx](http://pscx.codeplex.com/)
* [NuGet](http://nuget.org)

Installing
----------
Verify you have .NET 4.0 installed

Verify you have PowerShell 2.0 or better with $PSVersionTable.PSVersion

Verify execution of scripts is allowed with Get-ExecutionPolicy (should be RemoteSigned or Unrestricted). If scripts are not enabled, run PowerShell as Administrator and call Set-ExecutionPolicy RemoteSigned -Confirm.

Verify that git can be run from PowerShell. If the command is not found, you will need to add a git alias or add %ProgramFiles%\Git\cmd to your PATH environment variable.

Clone the posh-env repository to your local machine.

Edit the git-config.psm1

From the posh-env repository directory, run .\install.ps1.

*NOTE THAT THIS WILL REPLACE ANY OTHER POWERSHELL PROFILE YOU HAVE*

License
-------
http://thedersen.mit-license.org/