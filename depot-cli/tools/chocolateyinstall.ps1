$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.101.67'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '474860b9d50e987c2ebb689ef82c2907fc7d2399735ca0a90127b88dcc6c4093'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '1d80aa416fd00430f92da7796da9aca6349fe976851f1765e706c17515d18c6d'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
