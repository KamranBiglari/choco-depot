$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.103.3'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '14a57ce2155d91cc0d4bcd6f29894b99e6192482fc313fc9191be364ec3122d7'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = 'b708df1634371dc91b2583b6e559f0fa43d14c2d0d29a60210124bc55db579e4'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
