$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.101.52'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '822cbb84ea11a46941576d28148d79eb42dba3043c53364bd4b7e0014f432c60'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '81971bf7729831933a6d8be28d8db0c69983adefd35f0a39d6a5c521262f743f'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
