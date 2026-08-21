$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.102.4'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = 'a909b3f7cd7a947079d43c7caf367f9eb87740e2edf74d5b7e91e8292acc5fe9'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '845f7ca05a8433bff7a1c701c9035e9383461a8cf0cd795b9cc5c207ba40400a'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
