$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.101.63'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = 'f098891878a78cf1c20fc0c9ed631d4585b5042bbe53d3f33a2a264c68a67d77'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = 'a0a800ba3ba8ceab50b2a020b95888bbd59bed09bae310e0bff459b76c6f646e'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
