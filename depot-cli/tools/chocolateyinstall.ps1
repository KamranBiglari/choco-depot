$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.101.65'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = 'cf5c68cc77fb8d0bf3a83e3ed3b0f0a57ac7557eccf7e5b8443c260ce0e49be1'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = 'e5aa237cd199511a86f267a2b40c12c52bfdc0d0c532eb659ab9dc3e29a4f40e'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
