$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.102.2'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '146dcd647a89e5178b69808379fe28e7588a0e8ba71ac40a8d7ed93e9ffad08e'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '8d2addbc974a77d2e81f910b2661ad0edc7fb7e711102a259097b81f9fa2903a'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
