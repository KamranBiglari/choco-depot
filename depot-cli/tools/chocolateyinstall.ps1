$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.102.6'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '0bac370c89dfe80d133471b2e08fbeac4cf0b49f2add39beac0ef138abb76add'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '15afe2a0d0f58dd94a018d92ced154c12d22190e59aec4f2e4012ee7bbd7224c'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
