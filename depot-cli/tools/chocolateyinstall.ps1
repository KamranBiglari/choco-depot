$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.101.72'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '519195e7929258dbb01354fe85ea798304799892c545e0de357a6ada5705254d'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '57e9f69d150244a939234d639ec0b8bc1125aeec7c5e981405d47177956ef714'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
