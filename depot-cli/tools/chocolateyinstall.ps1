$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.103.9'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '755216009da52d5a529b8521d79875afa8888fa641776aa049fe4fec96abb86f'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '354ea8cdba8b10f2123b958dbedd4471a3f0b41645a8fd79282b9b6c3b32df72'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
