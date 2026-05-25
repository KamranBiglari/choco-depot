# choco-depot

Unofficial [Chocolatey](https://community.chocolatey.org/) package for the
[Depot CLI](https://github.com/depot/cli) - the official CLI for
[Depot](https://depot.dev), a remote container build service.

## Build faster. Waste less time.

Code isn't the bottleneck anymore. Your build pipeline is. Depot accelerates every part of it — so the velocity AI gives you doesn't die waiting for CI.


The package sources live in [`depot-cli/`](./depot-cli); releases are
produced and pushed to the Chocolatey community feed by the
[`Update & publish`](./.github/workflows/publish.yml) GitHub Actions
workflow.

## Install

```powershell
choco install depot-cli
choco upgrade  depot-cli
```

### What ends up in git

Each published version leaves behind:

- A commit: `depot-cli: bump to <version>`
- An annotated tag: `v<version>`
- A workflow run with `depot-cli.<version>.nupkg` attached as an
  artifact.

So the full history of what was ever on the Chocolatey community feed is
recoverable from `git tag -l`.

## Build the package locally (optional)

You only need this to smoke-test changes before pushing.

```powershell
cd depot-cli
choco pack
choco install depot-cli -s "$(Resolve-Path .)" -y
depot --version
choco uninstall depot-cli -y
```

For a clean-room test, use the official
[chocolatey-test-environment](https://github.com/chocolatey/chocolatey-test-environment).

## Running the AU updater locally (optional)

```powershell
Install-Module -Name Chocolatey-AU -Force -Scope CurrentUser
cd depot-cli
./update.ps1          # updates if a newer release exists
./update.ps1 -Force   # re-runs regardless
$env:DEPOT_VERSION = 'v2.101.47'; ./update.ps1 -Force   # pin a specific version
```

## Moderation

First-time submissions to the Chocolatey community feed go through human
moderation (usually a few days to a couple of weeks). While a version
is in moderation, additional pushes for the same package id are blocked
by the feed with a bare HTTP 403; this is normal and resolves on its
own once the moderator approves the pending version. After approval,
subsequent version bumps are reviewed automatically. If moderators
request changes, edit the nuspec / install script on a branch, open a
PR, merge, then re-run the workflow to re-push.

## Notes

- This is a community-maintained package. It is not affiliated with or
  endorsed by Depot Technologies Inc.
- The package does **not** embed any Depot binaries; it downloads the
  official archive from GitHub at install time and verifies it with the
  pinned SHA256 checksums.
- Depot CLI is licensed under the MIT License. See
  [`depot-cli/tools/LICENSE.txt`](./depot-cli/tools/LICENSE.txt).
