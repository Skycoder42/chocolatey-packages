
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url64bit      = "https://github.com/Skycoder42/qpmx/releases/download/${env:ChocolateyPackageVersion}/qpmx-${env:ChocolateyPackageVersion}_msvc2017_64.zip"
  checksum64    = '61c30d35a727099d2c66ee43fcf949acff96ff6741f46caf23447436c09ba7b8'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
