$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.101.78'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '44619f4f5f784e58582a9c3428ad74ac30a8cf37121eca1721f3ecfa596e9dc2'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '1cf54ea22ddb0bc422044788bbaa701c0f8d1acbc6a25194cccab94d51242398'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
