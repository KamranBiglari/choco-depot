$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.101.46'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '3e0fd7ce5e7d90713e1b94c17aa37f614c08a2534264a6aa5d33749b35de2f2e'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '301e17079a46725278a9fe1192826cffc7aa71757d99d4e4eaeeba4a320d9662'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
