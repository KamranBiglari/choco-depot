$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.101.60'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '7905b2fde50de2e29cd97e9353ed359918ddfcf956cf92cfa7abbfdd1877d016'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '50a141fe7bbba6b28959857f8af27c4771bc6ecaafe4beb8d1d3ee3b0502b1c2'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
