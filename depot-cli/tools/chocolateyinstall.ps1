$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.101.73'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = '979eaaa15fc1c632c778d8f4a41c8e6ad6220a71a61756b58184f1400e207315'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = '472161f7be8bf019ad9f3b0db6c525be251c6638a48a6263423d50ebfe952723'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
