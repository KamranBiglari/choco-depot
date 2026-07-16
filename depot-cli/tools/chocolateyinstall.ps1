$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.101.74'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = 'b29e7468d1d58309537f18c3954b16712bb4b63121e81fa20c3ff69d85a453a8'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '15dff2de6d5b4389127e40a351e9e7523148a3f2419f8347682fb06a699ca408'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
