$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.102.8'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = 'd610ca85e0f7877deea363b8b0a891bf6c9cb35b43175459c338ec747ac68494'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = 'e4de0848f9b06a9a47838883d95f4c18abddd9c1b622727cda62c40536f109e7'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
