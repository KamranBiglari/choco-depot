$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.102.15'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '86d14dd8e1047c37c1e3f8f9f94c7870b013f615fc6571cc7e629a2d5ef934a8'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = 'd608689fdd5d923dcca7955a1c0c114178ebf15fb62de6fff370583e61a9f0ff'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
