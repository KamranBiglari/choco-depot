$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$version  = '2.103.12'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_386.zip"
  checksum       = 'ae6ccc507e38ecae3e8b079e3f4b63801edbbc2ee35adb739c654e6e6f7f83bf'
  checksumType   = 'sha256'
  url64bit       = "https://github.com/depot/cli/releases/download/v$version/depot_${version}_windows_amd64.zip"
  checksum64     = 'a8d8056694a8aeed602e51be0e3309eadb60a42ce08070efc207d5e9699d4f32'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
