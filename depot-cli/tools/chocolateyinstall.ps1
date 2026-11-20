$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.103.30'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = 'fb9ec0b9bbc750f3ea80d2c67f8119c3d0a2f485967a54286bdb48c17045f056'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '775e2d106aeb6eb6f99265e38ad228171ba65469334233ec0020edc20949ab58'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
