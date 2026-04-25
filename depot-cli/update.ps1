[CmdletBinding()]
param(
    [switch]$Force
)

Import-Module Chocolatey-AU

$releases = 'https://api.github.com/repos/depot/cli/releases/latest'

function global:au_SearchReplace {
    @{
        'tools\chocolateyinstall.ps1' = @{
            "(?i)(^\s*\`$version\s*=\s*)'.*'"      = "`$1'$($Latest.Version)'"
            "(?i)(^\s*checksum\b\s*=\s*)'.*'"      = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksum64\b\s*=\s*)'.*'"    = "`$1'$($Latest.Checksum64)'"
        }
        'depot-cli.nuspec' = @{
            "(?i)(<releaseNotes>[^<]*/v)[\d.]+(</releaseNotes>)" = "`${1}$($Latest.Version)`$2"
        }
    }
}

function global:au_AfterUpdate ($Package) {
    $verification = @"
VERIFICATION

Verification is intended to assist the Chocolatey moderators and community
in verifying that this package's contents are trustworthy.

This package does not embed any binaries. The Depot CLI archive is
downloaded directly from the official GitHub release at install time and
verified with SHA256 checksums that are pinned inside
tools\chocolateyinstall.ps1.

Upstream project: https://github.com/depot/cli
Upstream release: https://github.com/depot/cli/releases/tag/v$($Latest.Version)

URL    (windows_386):   $($Latest.URL32)
SHA256 (windows_386):   $($Latest.Checksum32)

URL    (windows_amd64): $($Latest.URL64)
SHA256 (windows_amd64): $($Latest.Checksum64)

To verify the checksums yourself, download each archive from the URL above
and run the following in PowerShell, comparing the result with the value
recorded above:

  Get-FileHash -Algorithm SHA256 <path-to-downloaded-zip>

Upstream license (MIT) is included in this package as LICENSE.txt, taken
verbatim from:
  https://raw.githubusercontent.com/depot/cli/main/LICENSE
"@

    Set-Content -Path (Join-Path $PSScriptRoot 'tools\VERIFICATION.txt') -Value $verification -Encoding utf8
}

function global:au_GetLatest {
    $tag = $env:DEPOT_VERSION
    if (-not $tag) {
        $headers = @{ 'User-Agent' = 'choco-depot-au' }
        if ($env:GITHUB_TOKEN) { $headers['Authorization'] = "Bearer $env:GITHUB_TOKEN" }
        $json = Invoke-RestMethod -Uri $releases -Headers $headers
        $tag  = $json.tag_name
    }
    if (-not $tag.StartsWith('v')) { $tag = "v$tag" }
    $version = $tag.TrimStart('v')

    @{
        Version = $version
        URL32   = "https://github.com/depot/cli/releases/download/$tag/depot_${version}_windows_386.zip"
        URL64   = "https://github.com/depot/cli/releases/download/$tag/depot_${version}_windows_amd64.zip"
    }
}

Push-Location $PSScriptRoot
try {
    update -ChecksumFor all -Force:$Force
}
finally {
    Pop-Location
}
