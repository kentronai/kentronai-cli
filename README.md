# Receipt CLI

Public binary releases for `receipt connect`.

`receipt connect` lets a signed-in user connect workspace resources such as
AWS, Google Cloud, GitLab, Linear, Datadog, Sentry, Cloudflare, Vercel,
Terraform Cloud, Incident.io, Azure DevOps, and Confluence through Receipt's
hosted Nango-backed Connect flow. Receipt stores only encrypted org-scoped
connection references.

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
receipt connect gcp
receipt connect gitlab
receipt connect datadog
receipt connect status
receipt connect disconnect --provider aws --name prod
```

## Supported Platforms

- macOS Apple Silicon: `darwin-arm64`
- macOS Intel: `darwin-x64`
- Linux x64: `linux-x64`
- Linux arm64: `linux-arm64`

## What Is In This Repo

This repository contains only the public installer and release artifacts for the
connect-only CLI. The private Receipt application source is not published here.
