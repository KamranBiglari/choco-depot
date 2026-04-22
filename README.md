# choco-depot

Unofficial [Chocolatey](https://community.chocolatey.org/) package for the
[Depot CLI](https://github.com/depot/cli) - the official CLI for
[Depot](https://depot.dev), a remote container build service.

The package sources live in [`depot-cli/`](./depot-cli); releases are
produced and pushed to the Chocolatey community feed by the
[`Update & publish`](./.github/workflows/publish.yml) GitHub Actions
workflow.

## Install (once published)

```powershell
choco install depot-cli
choco upgrade  depot-cli
```

## One-time repo setup

1. Create a Chocolatey community account at <https://community.chocolatey.org/>.
2. Copy your API key from <https://community.chocolatey.org/account>.
3. In this repo, go to **Settings → Secrets and variables → Actions → New repository secret**
   and add:
   - Name: `CHOCO_API_KEY`
   - Value: the API key from step 2.

That's it. After that, version bumps are fully automated.

## How new versions get published

There are two ways — both handled by a single workflow
(`.github/workflows/publish.yml`):

### 1. Automatically (the default)

A scheduled job runs daily. It:

1. Queries `https://api.github.com/repos/depot/cli/releases/latest`.
2. If the tag is newer than the version in `depot-cli.nuspec`, runs the
   [Chocolatey-AU](https://wormiecorp.github.io/Chocolatey-AU/) script
   `depot-cli/update.ps1`, which:
   - Rewrites `<version>` in the nuspec.
   - Rewrites `$version`, `checksum`, `checksum64` in
     `tools/chocolateyinstall.ps1` (checksums are computed by downloading
     the upstream zips and hashing them — no manual work).
   - Rewrites URLs and checksums in `tools/VERIFICATION.txt`.
3. Commits the bump to `main` as `github-actions[bot]` with the message
   `depot-cli: bump to <version>`.
4. Creates and pushes an annotated git tag `v<version>`.
5. Packs `depot-cli.<version>.nupkg`.
6. Runs `choco push` against `push.chocolatey.org` using `CHOCO_API_KEY`.

If the upstream hasn't changed, the run is a no-op and nothing is
committed or pushed.

### 2. Manually (when you want control)

You do **not** need to create a branch or hand-edit any files. Just:

1. Go to **Actions → Update & publish depot-cli → Run workflow**.
2. Fill in the form:
   - **version** *(optional)* - e.g. `v2.101.47` or just `2.101.47`.
     Leave blank to use the latest GitHub release.
   - **force** - re-run search/replace even if the version is unchanged
     (useful if you tweaked the nuspec and want a re-push).
   - **publish** - uncheck to produce and upload the `.nupkg` as a
     workflow artifact for inspection without pushing to the community
     feed.
3. Click **Run workflow**. The same pipeline as the scheduled job runs.

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
moderation (usually a few days). Subsequent version bumps are reviewed
automatically. If moderators request changes, edit the nuspec / install
script on a branch, open a PR, merge, then re-run the workflow with
**force = true** to re-push.

## Notes

- This is a community-maintained package. It is not affiliated with or
  endorsed by Depot Technologies Inc.
- The package does **not** embed any Depot binaries; it downloads the
  official archive from GitHub at install time and verifies it with the
  pinned SHA256 checksums.
- Depot CLI is licensed under the MIT License. See
  [`depot-cli/tools/LICENSE.txt`](./depot-cli/tools/LICENSE.txt).
