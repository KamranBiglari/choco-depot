$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.101.57'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '61b78c9486730c6f0be6da0f3c8554656d7b67f83ba7b61e7f1e2b4ee359587b'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '97c3e485898ea37a96ca9c73752604906902f4701fca685cf95596b285297d0d'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
