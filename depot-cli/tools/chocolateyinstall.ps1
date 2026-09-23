$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.102.12'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = 'dc2e3b95cc80a2d0b3b5202971fd318d4523a3092d7efb82ba13c3a763e64677'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '27f46aa59e5908a177e4cb81da225210f3d82d070ceade8da2ec555cfbedb0e1'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
