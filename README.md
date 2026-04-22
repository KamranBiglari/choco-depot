# choco-depot

Unofficial [Chocolatey](https://community.chocolatey.org/) package for the
[Depot CLI](https://github.com/depot/cli) - the official CLI for
[Depot](https://depot.dev), a remote container build service.

The package lives in [`depot-cli/`](./depot-cli).

## Install (once published)

```powershell
choco install depot-cli
```

## Build the package locally

You need Chocolatey installed on a Windows machine (or a Windows VM / CI
runner).

```powershell
cd depot-cli
choco pack
```

That produces `depot-cli.<version>.nupkg` in the current directory.

## Test the package locally

Install from the local `.nupkg` without touching the community feed:

```powershell
choco install depot-cli -s "$(Resolve-Path .)" -y
depot --version
choco uninstall depot-cli -y
```

For a clean-room test, use the official
[chocolatey-test-environment](https://github.com/chocolatey/chocolatey-test-environment).

## Publish to the Chocolatey community repository

1. Create an account at <https://community.chocolatey.org/> and copy your
   API key from <https://community.chocolatey.org/account>.
2. Register the key on the machine that will push:
   ```powershell
   choco apikey --key <YOUR_API_KEY> --source https://push.chocolatey.org/
   ```
3. Push the nupkg:
   ```powershell
   choco push depot-cli.2.101.46.nupkg --source https://push.chocolatey.org/
   ```
4. The package then enters the community moderation queue. Moderators will
   run automated and human review; respond to any feedback in the listing's
   comments. First-time packages from a new maintainer are usually reviewed
   within a few days.

## Updating for a new Depot CLI release

1. Bump `<version>` in `depot-cli/depot-cli.nuspec`.
2. Update `$version` and the two SHA256 checksums in
   `depot-cli/tools/chocolateyinstall.ps1`. Get the checksums with:
   ```powershell
   $v = '<new-version>'
   foreach ($arch in '386','amd64') {
     $url = "https://github.com/depot/cli/releases/download/v$v/depot_${v}_windows_$arch.zip"
     $tmp = New-TemporaryFile
     Invoke-WebRequest $url -OutFile $tmp
     "{0}  {1}" -f (Get-FileHash $tmp -Algorithm SHA256).Hash.ToLower(), $arch
     Remove-Item $tmp
   }
   ```
3. Update the two checksum lines in `depot-cli/tools/VERIFICATION.txt` and
   bump the upstream release URL.
4. Repack, test, push.

## Notes

- This is a community-maintained package. It is not affiliated with or
  endorsed by Depot Technologies Inc.
- The package does **not** embed any Depot binaries; it downloads the
  official archive from GitHub at install time and verifies it with the
  pinned SHA256 checksums.
- Depot CLI is licensed under the MIT License. See
  [`depot-cli/tools/LICENSE.txt`](./depot-cli/tools/LICENSE.txt).
