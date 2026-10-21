$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.102.25'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '1daa4bebb7a8a83f2e361dd0af230bae851f2e071349818ea47f72b11a5dce3a'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = 'a50b901fdf3c4f5ac9b244f31a5387702414c90138cd9b37fc2ee70a8379fea7'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
