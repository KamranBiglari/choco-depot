$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.103.21'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = 'efdfb09066af7d8a62e665784ce4b332e09a2a9ae898f87bb597f703264620b9'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '7d66387e9105379bf83aafb99cfdc3386f0ee4b5364c8495864f6907b4994212'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
