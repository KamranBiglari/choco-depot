$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.103.10'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '45c94a92fc92995e0ec4c7b8f644575004a6c8d38fc58566acfab43ea32120cc'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = 'b5826cd4515800ca590e368170168175bf6428bd25e3fde723d605bc5b4053f8'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
