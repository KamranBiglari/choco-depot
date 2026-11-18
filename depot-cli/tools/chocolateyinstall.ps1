$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.103.26'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '726d32eb53b9e5e61189d8e975ec08002bccc1bed4393ed9f814d96851c9f0fe'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '0b83b0ceccf0383c19a52c48f163057ebf89877bfab36a0aab400482ca83ceca'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
