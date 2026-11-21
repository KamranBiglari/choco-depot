$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.103.33'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = 'bd061a29d7ae5d2e274342861b97ad73e8fea5a3e24958e39966799d07ace370'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '870fae274c7898b5d1bc2e35bf9ecf83c9cbbe0712d22c29d9bf29d9fb788edd'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
