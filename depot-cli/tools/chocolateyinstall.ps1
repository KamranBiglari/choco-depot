$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.101.75'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '32bca36b965ce72fae08fcbe0be6dcab190fec43a63f72fb3773a60c77f24936'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '992a8e28dc6e3c67642208e331bcc9a22190bb37538dc0519a3b2738d9ab87f0'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
