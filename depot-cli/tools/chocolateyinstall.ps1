$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.102.9'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '81b6239c6b5b9dd22b1f5b03d9cf6bfca275cfcc7b60f6edbea5e5447056d949'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '0eef874708de7539279e95a9f2d3c25bac9a37beaf66e01752c5088f24a020c3'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
