posh-env
========
This repo contains various command line stuff that I use when working on a Windows box:

* [git-tfs](https://github.com/spraints/git-tfs)
* [posh-git](https://github.com/dahlbyk/posh-git)
* [curl](http://curl.haxx.se/)
* [pscx](http://pscx.codeplex.com/)
* [NuGet](http://nuget.org)

Feel free to [fork it](https://github.com/thedersen/posh-env/fork) and add your own stuff.

Installing
----------
1. Verify you have .NET 4.0 installed.

2. Verify you have PowerShell 2.0 or better with `$PSVersionTable.PSVersion`.

3. Verify execution of scripts is allowed with `Get-ExecutionPolicy` (should be `RemoteSigned` or `Unrestricted`). If scripts are not enabled, run PowerShell as Administrator and call `Set-ExecutionPolicy RemoteSigned -Confirm`.

4. Verify that git can be run from PowerShell. If the command is not found, you will need to add a git alias or add `%ProgramFiles%\Git\cmd` to your PATH environment variable.

5. Clone the posh-env repository to your local machine.

6. Edit the `git-config.ps1`.

7. From the posh-env repository directory, run `.\install.ps1`.

*NOTE THAT THIS WILL REPLACE ANY OTHER POWERSHELL PROFILE YOU MIGHT HAVE*

License
-------
http://thedersen.mit-license.org/