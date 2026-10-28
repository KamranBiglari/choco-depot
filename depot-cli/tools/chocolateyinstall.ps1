$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.103.4'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '96baaea296f20200824193156022cf36e428cb29095fa0c790bc5cfc1511805e'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = 'adeb3783cbef7f24df86cf57b0d0c4cc411f42c8f46d201033c25e2a43080154'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
