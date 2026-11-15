$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.103.18'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '5e39d0dd382e658b47ac7691076b43265141488fccec9090adebc5ca87b16cb4'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = 'c65d1cc3837118f3787c37b42e887f82bf738726376c9325905e603d5e07ff5b'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
