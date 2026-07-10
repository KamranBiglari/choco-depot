$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.101.70'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '61b4fb51a937406e7b4b0af782026ae56040fe918e3ba008904d8edb813d4727'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '01b80b618a86549ae4463a12cc4a1e4fd5fd11fbf6df37f992f3c9c68bbdfef1'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
