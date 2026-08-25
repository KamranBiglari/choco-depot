$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.102.7'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '6b8b9d39b8bcc5f7d4bee8068d887933cfd0b3b16329140da0456b8d55ed606d'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = 'bab6910b8fe62884f7a65adcbf11e3c4f5f7fb98886c00bc442d42b8b3c011e1'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
