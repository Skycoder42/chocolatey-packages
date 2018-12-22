
$desktopPath = [Environment]::GetFolderPath("Desktop")
$startMenuPath = [Environment]::GetFolderPath("Programs")

Remove-Item -Path "$desktopPath\KeePass-Transfer.lnk" -Force
Remove-Item -Path "$startMenuPath\KeePass-Transfer" -Recurse -Force
