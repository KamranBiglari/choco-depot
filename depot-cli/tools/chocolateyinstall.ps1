$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.101.47'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '18a5ba0341b1218aed3f80e88c3d755105779636712fe4f7a586d2e76d008a3b'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '807eea4adcc89f13c6fc7686891b682ae1e961f6282519a974e58a626ef52451'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
