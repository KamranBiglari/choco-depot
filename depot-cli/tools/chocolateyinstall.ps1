$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.101.62'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = 'bcabf930445c4dbce55d210f3e1012a6e84107560dc33aa44161cfbfd59b405c'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = 'c8dab7f6a9d52fe0985d5569d10f0cc2c9c3c7de1ddc795922129a1a02fdeda3'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
