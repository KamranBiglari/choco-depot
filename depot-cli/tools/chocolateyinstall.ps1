$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.102.16'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '6d597ef78a442cbd5f02c5fc5fec49c31453ecb388b96d3645fdf14ee80f3656'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '6941d62ef68b377ffa3bd5c6a90595e0a714343824a09159e3f74e6c351ebd8f'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
