$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.101.76'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = 'cf7ae27ec985eb2b5ff25360099b380af09cc3605992675f203e48b2cf89073a'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '28161b0c13a5ce445a5a0229751368a8e67d51da6ec7609e8ef95a797cfaa870'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
