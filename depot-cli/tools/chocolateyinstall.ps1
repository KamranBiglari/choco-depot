$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.102.19'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '86dceeac2bdf245738a6d13533cff48475838ef863e4edbbaa49c6715a168c91'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = 'cd84c260e3085d11a7ec12c3fea195b36b15c03c26468b0db2fa0c0322c9f977'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
