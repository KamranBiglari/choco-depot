$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.101.61'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '21d1f89403890d88f2ff48293fafabe6f0b86e1bb24ddfe2fca54105b1aaeb0a'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '51122d95a77ac95864acb10b87486a532e9da00c154e84e0f1aee2921bdbc4ad'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
