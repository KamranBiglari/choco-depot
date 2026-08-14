$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.102.0'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '7f8b68d6dcb8315b11c21ac3bc65946ee1c2b3b95aafa87da6290f3fd8d50547'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = 'ad2b17f44d9b6b04a3b608e6bde5613bd667ff6230040fa43dc4f63aa3261836'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
