$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.102.18'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '69c7c9f7b3dfdbd3949823d87778bc62bc67d09e64ba51f857d016a64a74cd39'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '59a1f7db43d735d4c3d765628b829937af892e84b73727ec0804ea974a7b966c'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
