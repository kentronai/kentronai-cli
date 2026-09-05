# Receipt CLI

Public binary releases for `receipt`, the Kentron AI CLI that connects Receipt
workspace resources and runs the Receipt MCP bridge.

`receipt connect` lets a signed-in user connect workspace resources such as
AWS, Google Cloud, GitHub, GitLab, Slack, Notion, Jira, Linear, HubSpot,
Stripe, Datadog, Sentry, Cloudflare, Vercel, Terraform Cloud, Incident.io,
Azure DevOps, and Confluence through Receipt's hosted Nango-backed Connect
flow. Receipt stores only encrypted org-scoped connection references.

Run `receipt --help` for the full list of supported providers.

## 1. Install the CLI

```bash
curl -fsSL https://raw.githubusercontent.com/kentronai/receipt-cli/main/install.sh | bash
```

The binary is installed to `~/.local/bin/receipt`. If that directory is not
already on your `PATH`, the installer prints the exact line to add. To use it
in the current shell right away:

```bash
export PATH="$HOME/.local/bin:$PATH"
receipt --version
receipt --help
```

## 2. Sign in

```bash
receipt setup
receipt workspace current
```

Complete the browser sign-in and select the desired Receipt workspace.

## 3. Connect integrations

In Receipt:

1. Open *Organization Settings → MCP Gateway*.
2. Select or create a workspace.
3. Open the workspace's *Integrations* page.
4. Connect the providers you want MCP to access.
5. Return to the workspace *Overview* page.

Or connect directly from the CLI:

```bash
receipt connect aws --profile prod
receipt connect gcp
receipt connect gitlab
receipt connect datadog
receipt connect status
receipt connect disconnect --provider aws --name prod
```

## 4. Install for Codex

```bash
receipt tools list
receipt mcp config codex
receipt mcp install codex
receipt mcp status codex
```

Restart Codex or reload its MCP servers afterward.

## Other MCP clients

Generate a generic configuration:

```bash
receipt mcp config generic --output receipt-mcp.json
```

Import `receipt-mcp.json` into any client supporting local STDIO MCP
servers, then refresh its tool list.

## Installer options

The installer reads these environment variables:

| Variable | Default | Purpose |
| --- | --- | --- |
| `RECEIPT_CLI_VERSION` | `v0.1.0-preview.6` | Release tag to install |
| `RECEIPT_CLI_REPO` | `kentronai/receipt-cli` | Repository to fetch release assets from |
| `RECEIPT_CLI_BIN_DIR` | `$HOME/.local/bin` | Install directory |
| `RECEIPT_CLI_BIN` | `$RECEIPT_CLI_BIN_DIR/receipt` | Full path of the installed binary |

For example, to install a specific version somewhere else:

```bash
curl -fsSL https://raw.githubusercontent.com/kentronai/receipt-cli/main/install.sh \
  | RECEIPT_CLI_VERSION=v0.1.0-preview.6 RECEIPT_CLI_BIN_DIR=/usr/local/bin bash
```

## Upgrading

Re-run the install command. It overwrites the existing binary in place.

If you installed an earlier build that was named `kentronai`, remove the stale
binary after upgrading, and re-run `receipt mcp install codex` so the MCP entry
points at the new path:

```bash
rm -f ~/.local/bin/kentronai
receipt mcp install codex
```

## Uninstalling

```bash
receipt mcp remove codex
rm -f ~/.local/bin/receipt
```

## Troubleshooting

```bash
receipt --version
receipt workspace current --json
receipt tools list
receipt mcp status codex
```

If `receipt: command not found`, `~/.local/bin` is not on your `PATH`; see
step 1. If more than one `receipt` is installed, `command -v receipt` shows
which one wins.

## Supported Platforms

- macOS Apple Silicon: `darwin-arm64`
- macOS Intel: `darwin-x64`
- Linux x64: `linux-x64`
- Linux arm64: `linux-arm64`

## Verifying a download

Every release publishes a `checksums.txt` alongside the tarballs, and the
installer verifies the SHA-256 of the asset before installing it. To check a
download by hand:

```bash
curl -fsSLO https://github.com/kentronai/receipt-cli/releases/download/v0.1.0-preview.6/receipt-darwin-arm64.tar.gz
curl -fsSLO https://github.com/kentronai/receipt-cli/releases/download/v0.1.0-preview.6/checksums.txt
shasum -a 256 -c --ignore-missing checksums.txt
```

## What Is In This Repo

This repository contains only the public installer and release artifacts for
the connect-only CLI. The private Kentron AI application source is not
published here.
