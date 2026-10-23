$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.103.2'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '717483945e8631b51230dfbc962935e2c3cca91fe33ea9dc16b55188dd5f7676'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '1f00fef6d384d1cf1f30df8de523f1b41b168c97773d4b728a15c4799749493a'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
