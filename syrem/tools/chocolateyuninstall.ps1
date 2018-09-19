
$desktopPath = [Environment]::GetFolderPath("Desktop")
$startMenuPath = [Environment]::GetFolderPath("Programs")

Remove-Item -Path "$desktopPath\Syrem.lnk" -Force
Remove-Item -Path "$startMenuPath\Syrem" -Recurse -Force
