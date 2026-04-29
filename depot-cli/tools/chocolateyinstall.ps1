$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.101.49'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '700973cc721151864225eba327b7d56de51f11bf2016ebfd3005e94f0384a57f'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '01bb70d1b486aa65b224827de010c92a8201d8a3735bcde3e3bf7364ce9295c8'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
