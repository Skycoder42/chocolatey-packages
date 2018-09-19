
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$desktopPath = [Environment]::GetFolderPath("Desktop")
$startMenuPath = [Environment]::GetFolderPath("Programs")

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url64bit      = "https://github.com/Skycoder42/Syrem/releases/download/${env:ChocolateyPackageVersion}/syrem-${env:ChocolateyPackageVersion}_msvc2017_64.zip"
  checksum64    = '270a5c63ee19be8eecee87a05cb63e3850a34bf3a5f8da63441cae823066326a'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
New-Item -ItemType file "$toolsDir\syrem.exe.gui"
New-Item -ItemType file "$toolsDir\vc_redist.x64.exe.ignore"

Install-ChocolateyShortcut -ShortcutFilePath "$desktopPath\Syrem.lnk" -TargetPath "$toolsDir\syrem.exe"
New-Item -ItemType Directory -Force -Path "$startMenuPath\Syrem"
Install-ChocolateyShortcut -ShortcutFilePath "$startMenuPath\Syrem\Syrem.lnk" -TargetPath "$toolsDir\syrem.exe"
Install-ChocolateyShortcut -ShortcutFilePath "$startMenuPath\Syrem\Syrem-Service.lnk" -TargetPath "$toolsDir\syremd.exe"
