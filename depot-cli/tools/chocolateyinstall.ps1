$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.102.1'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = 'da93dea1f1b8b84c35a6bf75b842804c52db82885c345766142a1982ad2dbf59'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '79416f46c9ca441861bbe5bc873d0ee72b07947c3194f8418c4d2921a00623c4'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
