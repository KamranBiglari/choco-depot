[CmdletBinding()]
param(
    [switch]$Force
)

Import-Module Chocolatey-AU

$releases = 'https://api.github.com/repos/depot/cli/releases/latest'

function global:au_SearchReplace {
    @{
        'tools\chocolateyinstall.ps1' = @{
            "(?i)(^\s*\`$version\s*=\s*)'.*'"        = "`$1'$($Latest.Version)'"
            "(?i)(^\s*checksum\b\s*=\s*)'.*'"        = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksum64\b\s*=\s*)'.*'"      = "`$1'$($Latest.Checksum64)'"
        }
        'tools\VERIFICATION.txt' = @{
            "(?i)(tag/v)[\d.]+"                                  = "`${1}$($Latest.Version)"
            "(?i)/v[\d.]+/depot_[\d.]+_windows_386\.zip"         = "/v$($Latest.Version)/depot_$($Latest.Version)_windows_386.zip"
            "(?i)/v[\d.]+/depot_[\d.]+_windows_amd64\.zip"       = "/v$($Latest.Version)/depot_$($Latest.Version)_windows_amd64.zip"
            "(?i)(SHA256\s*\(windows_386\):\s+)[a-f0-9]{64}"     = "`${1}$($Latest.Checksum32)"
            "(?i)(SHA256\s*\(windows_amd64\):\s+)[a-f0-9]{64}"   = "`${1}$($Latest.Checksum64)"
        }
        'depot-cli.nuspec' = @{
            "(?i)(<releaseNotes>[^<]*/v)[\d.]+(</releaseNotes>)" = "`${1}$($Latest.Version)`$2"
        }
    }
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
