$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.101.69'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '5edf1fb382748da36ad9d5af92b1b5b15ca916b478188dd534efd69611281f18'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '9d4ef546a1098725a1a530e3b404e4b7eaaafd4404c864d2ab893d444bbdc2a2'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
