$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.102.17'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '6e93abdd473f278d87fa9f9105aa8c85baaa95eb8624896db46966ffb65e1cb7'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '8b1260383b14c252e45c486483097ade0fcc23b0ec06d434fabd0c55507aeb3e'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
