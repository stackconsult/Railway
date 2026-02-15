# OpenClaw Railway Template

![OpenCrawl Logo](https://openclaw.ai/og-image.png)

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/openclaw-railway-t-1?referralCode=QXdhdr&utm_medium=integration&utm_source=template&utm_campaign=generic)

Self-hosted AI agent framework deployed on Railway.

## Quick Start

1. **Deploy**: Click the "Deploy on Railway" button above
2. **Configure**: Set `SETUP_PASSWORD` in Railway dashboard  
3. **Setup**: Visit `https://your-app.up.railway.app/setup`
4. **Configure OpenClaw**: Follow the setup wizard

## Required Environment Variables

```bash
SETUP_PASSWORD=your-secure-password-here
OPENCLAW_STATE_DIR=/data/.openclaw
OPENCLAW_WORKSPACE_DIR=/data/workspace
```

## Optional Variables

```bash
OPENCLAW_GATEWAY_TOKEN=your-stable-token-here
NODE_MAX_OLD_SPACE_SIZE=4096
NODE_MAX_SEMI_SPACE_SIZE=256
```

## Architecture

- **Wrapper Server**: Express app on port 8080 with setup wizard
- **OpenClaw Gateway**: Internal AI agent gateway on port 18789
- **Volume**: `/data` for persistent configuration and workspace

## Health Check

- `/setup/healthz` - Railway health check endpoint
- Requires setup password and OpenClaw configuration

## Troubleshooting

- **Gateway not ready**: Check Railway logs for OpenClaw startup errors
- **Setup inaccessible**: Verify `SETUP_PASSWORD` is set
- **Data loss**: Ensure `/data` volume is attached in Railway

## Documentation

- [Deployment Guide](docs/DEPLOYMENT_GUIDE.md)
- [Changelog](docs/CHANGELOG.md)
