$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.102.14'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '8c1a33b2abcaeade1cf613a8f7845d38ada6a826a8b5fe370d3fa1e7d42b218c'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = 'c4084903089f21c83ab9d156b4c53700853631e00799bbd412cfbd4fbe2b8db8'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
