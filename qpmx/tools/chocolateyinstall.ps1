
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url64bit      = "https://github.com/Skycoder42/qpmx/releases/download/${env:ChocolateyPackageVersion}/qpmx_win_deployed.zip"
  checksum64    = '5d54939bdd084591d6a3f75ea169e1d5ee3b943a9c7e54508372fac3e1d0d5f0'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
