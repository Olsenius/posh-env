# User
git config --global user.name thedersen
git config --global user.email thedersen@gmail.com

# Core
git config --global --replace-all core.autocrlf false
git config --global --replace-all core.ignorecase true
#git config --global core.editor mate -w

# Diff/Merge (Beyond Compare)
$bcomp = Get-ProgramFilesDir | Join-Path -ChildPath "beyond compare 3/bcomp.exe"
git config --global diff.tool bc3
git config --global difftool.bc3.path $bcomp

git config --global merge.tool bc3
git config --global mergetool.bc3.path $bcomp
git config --global mergetool.keepBackup false

# Aliases
git config --global alias.last "cat-file commit HEAD"