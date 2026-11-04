$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.103.8'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '237d0f5000861b0e9167c52f895e11b2d3596aeab63be17eb8907b9daeb892db'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '7499d65cdc0cb2f2bf3dc9f467048fb04832b9d27521ee60aa663800e50d8693'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
