# Receipt CLI

Public binary releases for `receipt connect`.

`receipt connect` lets a signed-in user lend local CLI credentials, such as
`aws`, `gh`, `git`, `kubectl`, or `gcloud`, to Receipt cloud jobs without
uploading those credentials to Receipt.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/skishore23/receipt-cli/main/install.sh | bash
```

Then run:

```bash
receipt connect setup
receipt connect
```

## Supported Platforms

- macOS Apple Silicon: `darwin-arm64`
- macOS Intel: `darwin-x64`
- Linux x64: `linux-x64`
- Linux arm64: `linux-arm64`

## What Is In This Repo

This repository contains only the public installer and release artifacts for the
connect-only CLI. The private Receipt application source is not published here.
