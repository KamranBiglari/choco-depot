$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.102.23'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = 'ce08f097dbbc8d5b185f49f0469de90c4292ee776772193013c183c182576020'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '97e39d1a748f7a31207b37b98a87418a002f292275f2a90c9a2e725ef9cbe860'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
