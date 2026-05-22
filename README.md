# Receipt CLI

Public binary releases for `receipt connect`.

`receipt connect` lets a signed-in user lend local CLI credentials, such as
`aws`, `gh`, `git`, `kubectl`, or `gcloud`, to Receipt cloud jobs without
running a local daemon. AWS credentials are imported from the user's local AWS
CLI, validated locally, and stored in Receipt's encrypted org-scoped connection
store. SaaS connectors such as Jira use the hosted Connect flow.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/skishore23/receipt-cli/main/install.sh | bash
```

Then run:

```bash
receipt connect setup
receipt connect
```

Useful commands:

```bash
receipt connect aws --profile prod
receipt connect jira
receipt connect status
receipt connect disconnect --provider aws --name prod
receipt connect relay --capability aws
```

## Supported Platforms

- macOS Apple Silicon: `darwin-arm64`
- macOS Intel: `darwin-x64`
- Linux x64: `linux-x64`
- Linux arm64: `linux-arm64`

## What Is In This Repo

This repository contains only the public installer and release artifacts for the
connect-only CLI. The private Receipt application source is not published here.
