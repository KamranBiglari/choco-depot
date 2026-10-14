$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.102.21'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '8ff9f2be4e2bacfffbda7b9cd15484c4e1f8cd4a131dd2ce845749b8432580dc'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '7118df63b8246b5ba58db856d95247a3448c990c3ee21589e4b338d5bceb6b99'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
