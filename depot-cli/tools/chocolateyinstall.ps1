$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.101.54'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = 'b66c241c14bd53c46188916b325ea5f8656822cde6c46841ce49b63aeb860241'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '46170e7f011ba942c7163de8bd5de7d00a11e1fac2a460419015cf9a6f95918e'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
