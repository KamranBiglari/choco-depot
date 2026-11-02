$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.103.6'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = 'b8193d1d22756b0ebd911d7dde3e782e95e7b600f5f5aab725868cabc5929263'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '2c72e9a3a228aac1f0aeff8129ab9d23afdc2ebd4740a6716c250bc51ea9c7d4'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
