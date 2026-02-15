# OpenClaw Railway Deployment Guide

This guide covers deploying OpenClaw on Railway with proper configuration and troubleshooting.

## Quick Start

1. **Deploy to Railway**: Click the "Deploy on Railway" button in README
2. **Set Environment Variables**: Configure required variables in Railway dashboard
3. **Access Setup**: Visit `https://your-app.up.railway.app/setup`
4. **Configure OpenClaw**: Follow the setup wizard

## Environment Variables

### Required
- `SETUP_PASSWORD`: Password for setup wizard (use Railway's `${{ secret() }}`)
- `OPENCLAW_STATE_DIR`: Must be `/data/.openclaw` for persistence
- `OPENCLAW_WORKSPACE_DIR`: Must be `/data/workspace` for persistence

### Optional (Recommended)
- `OPENCLAW_GATEWAY_TOKEN`: Stable auth token (use Railway's `${{ secret() }}`)
- `NODE_MAX_OLD_SPACE_SIZE`: Node.js memory limit (default: 4096)
- `NODE_MAX_SEMI_SPACE_SIZE`: Node.js semi-space limit (default: 256)

### Advanced
- `PORT`: Server port (Railway sets automatically)
- `INTERNAL_GATEWAY_PORT`: Gateway port (default: 18789)
- `OPENCLAW_ENTRY`: OpenClaw entry point (auto-detected)
- `OPENCLAW_NODE`: Node.js command with memory flags

## Architecture

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   Railway      │    │  Express Wrapper │    │  OpenClaw       │
│   Load Balancer│────▶│   Server (8080)  │────▶│  Gateway (18789)│
└─────────────────┘    └──────────────────┘    └─────────────────┘
                              │
                              ▼
                       ┌─────────────────┐
                       │   Setup Wizard  │
                       │   /setup/*      │
                       └─────────────────┘
```

## Memory Configuration

The deployment includes optimized Node.js memory settings:

- **Old Space**: 4GB (configurable via `NODE_MAX_OLD_SPACE_SIZE`)
- **Semi-space**: 256MB (configurable via `NODE_MAX_SEMI_SPACE_SIZE`)

This prevents JavaScript heap out of memory errors during intensive operations.

## Data Persistence

Railway provides a volume mount at `/data` that persists across deployments:

- `/data/.openclaw/`: OpenClaw configuration and state
- `/data/.linuxbrew/`: Homebrew installation
- `/data/workspace/`: OpenClaw workspace files

## Troubleshooting

### Gateway Issues

**Problem**: "Gateway did not become available in time"

**Solutions**:
1. Check the debug endpoint: `/setup/api/debug`
2. Verify OpenClaw installation in logs
3. Increase memory limits if needed
4. Check Railway logs for startup errors

**Debug Endpoint**: Visit `/setup/api/debug` (requires setup password) for:
- Gateway status and configuration
- OpenClaw version and entry point
- Environment variables and paths

### Memory Issues

**Problem**: JavaScript heap out of memory

**Solutions**:
1. Increase `NODE_MAX_OLD_SPACE_SIZE` (try 8192)
2. Increase `NODE_MAX_SEMI_SPACE_SIZE` (try 512)
3. Check for memory leaks in OpenClaw skills

### Setup Issues

**Problem**: Setup wizard not accessible

**Solutions**:
1. Verify `SETUP_PASSWORD` is set
2. Check Railway health checks
3. Review deployment logs

## Health Checks

The deployment includes health checks:
- **Railway Health Check**: `/setup/healthz` (every 30s)
- **Gateway Health**: Internal checks every 500ms during startup

## Security

- **Setup Authentication**: Password-protected setup wizard
- **Gateway Authentication**: Token-based API authentication
- **Volume Permissions**: Proper file permissions on `/data`

## Performance

- **Startup Time**: ~60-120 seconds for gateway initialization
- **Memory Usage**: 4GB+ allocated, varies by workload
- **Network**: Internal gateway communication on localhost

## Monitoring

Monitor these metrics in Railway:
- **Memory Usage**: Should stay under allocated limits
- **Response Time**: Setup wizard and API responses
- **Error Rate**: Gateway startup failures

## Scaling

- **Vertical**: Increase memory limits via environment variables
- **Horizontal**: Multiple Railway instances (each with own state)
- **Storage**: Volume size automatically managed by Railway

## Support

For issues:
1. Check Railway deployment logs
2. Use `/setup/api/debug` endpoint
3. Review OpenClaw documentation
4. Check GitHub issues for known problems
