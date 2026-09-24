$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.102.13'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '7e69c6f9db8d6408eda30c7da11a2863ae15334373b3b1d7ead3f874a5f6b9b3'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = 'b45daba6db2dfa17538fa9232c701df61cf135ce26d1b79fd4b6f7ec571e7fa0'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
