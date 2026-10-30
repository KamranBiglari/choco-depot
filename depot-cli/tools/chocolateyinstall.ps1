$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.103.5'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = 'da3c333cf64570c8183d6468f1469375479ef85f7260bedc3905f375af4bdcf5'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = 'd6f9b75e605e4408e6ef4cd55fb89188e476e5f1aa6e66b3624e557f5dd52169'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
