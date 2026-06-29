$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.101.66'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = 'c4ce118c9c190ff830af8919204971dabdb8a1fab3de9109af64dadcf848810b'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '9bc3b32101fa463f82418b76e6f784e73076f33a4b6d2fd83a6fa64a66247ec1'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
