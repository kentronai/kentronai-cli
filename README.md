# Kentronai CLI

Public binary releases for `kentronai`, the CLI that connects Receipt
workspace resources and runs the Receipt MCP bridge.

`kentronai connect` lets a signed-in user connect workspace resources such as
AWS, Google Cloud, GitLab, Linear, Datadog, Sentry, Cloudflare, Vercel,
Terraform Cloud, Incident.io, Azure DevOps, and Confluence through Receipt's
hosted Nango-backed Connect flow. Receipt stores only encrypted org-scoped
connection references.

## 1. Install the CLI

```bash
curl -fsSL https://raw.githubusercontent.com/kentronai/kentronai-cli/main/install.sh | bash
export PATH="$HOME/.local/bin:$PATH"

kentronai --version
```

Do not use `npm install kentronai`; that is an unrelated package.

## 2. Sign in

```bash
kentronai setup
kentronai workspace current
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
kentronai connect aws --profile prod
kentronai connect gcp
kentronai connect gitlab
kentronai connect datadog
kentronai connect status
kentronai connect disconnect --provider aws --name prod
```

## 4. Install for Codex

```bash
kentronai tools list
kentronai mcp config codex
kentronai mcp install codex
kentronai mcp status codex
codex mcp get kentronai --json
```

Restart Codex or reload its MCP servers afterward.

## Other MCP clients

Generate a generic configuration:

```bash
kentronai mcp config generic --output kentronai-mcp.json
```

Import `kentronai-mcp.json` into any client supporting local STDIO MCP
servers, then refresh its tool list.

## Troubleshooting

```bash
kentronai --version
kentronai workspace current --json
kentronai tools list
kentronai mcp status codex
```

## Supported Platforms

- macOS Apple Silicon: `darwin-arm64`
- macOS Intel: `darwin-x64`
- Linux x64: `linux-x64`
- Linux arm64: `linux-arm64`

## What Is In This Repo

This repository contains only the public installer and release artifacts for
the connect-only CLI. The private Receipt application source is not
published here.
