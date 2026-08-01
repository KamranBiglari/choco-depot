$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.101.77'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = 'e897fcb55b34f39d37e899feadd67d9c3c8367041accccab8c12ca697ad31673'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = 'e5a31e19427980df7de55db03ee16d5d1ec9b5c7e0137afdbc745ca5470144b4'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
