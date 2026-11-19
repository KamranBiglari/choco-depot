$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.103.29'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = 'eedb370f99a3ff78babfe01a6fc104b636793b48c55fa6b6332fc0b3c43d4f43'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = 'cdd7d0880ea65ed4022f2243220e38defd6a7e3652d7f501eb9f63be9dbbfb8d'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
