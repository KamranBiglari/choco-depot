$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.103.17'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = 'a41bdc82d4aeef57f028f08a4f93980442fcd0810e37c25c0dbdd6d2eaa5e8f4'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '9b5b74cd34712ec3633500fb249d4a976626357d56148eb7ae9c5b3a5b5b5c67'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
