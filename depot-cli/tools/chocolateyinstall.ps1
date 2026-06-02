$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.101.64'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '5a3f374f3a3e761f1bc84495fa00349fb586c8c2377f0e1d0f0fda448c295d7f'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '88ea872c1979e3d75fae66d9753caca54197afee9a0fe3ccc3b527f50c829cbc'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
