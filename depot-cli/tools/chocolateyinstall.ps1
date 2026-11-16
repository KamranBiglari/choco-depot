$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.103.20'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = 'deee26660ab3ce79cc9e2a39c85887fe9858f2d0721cce412c762a9885c32058'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '15bf3d829c0e460b332d72808a0d7d689307070efd2758946b9de9edc08b547b'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
