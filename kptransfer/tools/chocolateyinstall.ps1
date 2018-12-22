
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$desktopPath = [Environment]::GetFolderPath("Desktop")
$startMenuPath = [Environment]::GetFolderPath("Programs")

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url64bit      = "https://github.com/Skycoder42/KeepassTransfer/releases/download/${env:ChocolateyPackageVersion}/kptransfer-${env:ChocolateyPackageVersion}_msvc2017_64.zip"
  checksum64    = 'ceaa53c2ae8d5af821db73e8bd7c0073163407380f08fd4176bc9c68bac96ad2'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
New-Item -ItemType file "$toolsDir\kptransfer-client.exe.gui"
New-Item -ItemType file "$toolsDir\vc_redist.x64.exe.ignore"

Install-ChocolateyShortcut -ShortcutFilePath "$desktopPath\KeePass-Transfer.lnk" -TargetPath "$toolsDir\kptransfer-client.exe"
New-Item -ItemType Directory -Force -Path "$startMenuPath\KeePass-Transfer"
Install-ChocolateyShortcut -ShortcutFilePath "$startMenuPath\KeePass-Transfe\KeePass-Transfer.lnk" -TargetPath "$toolsDir\kptransfer-client.exe"
