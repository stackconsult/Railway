![OpenCrawl Logo](https://openclaw.ai/og-image.png)

# Deploy and Host OpenClaw Railway Template on Railway

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/openclaw-railway-t-1?referralCode=QXdhdr&utm_medium=integration&utm_source=template&utm_campaign=generic)

**OpenClaw** is a self-hosted AI agent framework that can execute commands, manage files, and perform tasks autonomously based on user instructions. This template deploys OpenClaw on Railway with minimal configuration, allowing you to run and access it remotely without managing servers. 🤖⚙️

![OpenCrawl Setup Complete Page](https://res.cloudinary.com/asset-cloudinary/image/upload/v1770581375/openclaw_sb_pa8ipt.png)

## 📚 Documentation

- **[Deployment Guide](docs/DEPLOYMENT_GUIDE.md)** - Complete setup and configuration instructions
- **[Changelog](docs/CHANGELOG.md)** - Version history and changes
- **[Memory Fix Summary](docs/MEMORY_FIX_SUMMARY.md)** - JavaScript heap memory issue resolution
- **[Gateway Fix Summary](docs/GATEWAY_FIX_SUMMARY.md)** - Gateway availability timeout fixes

## 🚀 Quick Start

1. **Deploy**: Click the "Deploy on Railway" button above
2. **Configure**: Set required environment variables in Railway dashboard
3. **Setup**: Visit `https://your-app.up.railway.app/setup`
4. **Configure OpenClaw**: Follow the setup wizard

## ⚙️ Required Environment Variables

```bash
SETUP_PASSWORD=your-secure-password-here
OPENCLAW_STATE_DIR=/data/.openclaw
OPENCLAW_WORKSPACE_DIR=/data/workspace
```

## 🔧 Optional Configuration

```bash
# Memory settings (recommended for production)
NODE_MAX_OLD_SPACE_SIZE=4096
NODE_MAX_SEMI_SPACE_SIZE=256

# Authentication
OPENCLAW_GATEWAY_TOKEN=your-stable-token-here
```

## 📋 What This Template Deploys

- **OpenClaw AI Agent**: Self-hosted framework with command execution
- **Express Wrapper Server**: Gateway management and setup wizard
- **Railway Integration**: Volume persistence, health checks, monitoring
- **Memory Optimization**: Pre-configured Node.js memory limits
- **Production Ready**: Enhanced error handling and diagnostics

## 🏗️ Architecture

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

## 🔍 Features

- **Zero Configuration**: Works out of the box with sensible defaults
- **Persistent Storage**: Configuration and workspace data preserved across deployments
- **Memory Optimized**: Pre-configured to prevent JavaScript heap errors
- **Health Monitoring**: Built-in health checks and debugging endpoints
- **Secure**: Token-based authentication and secure setup wizard
- **Scalable**: Easy to scale vertically with configurable memory limits

## 🐛 Troubleshooting

### Gateway Issues

If you experience "Gateway did not become available in time" errors:

1. Check the debug endpoint: `/setup/api/debug`
2. Review the [Gateway Fix Summary](docs/GATEWAY_FIX_SUMMARY.md)
3. Verify environment variables in Railway dashboard

### Memory Issues

If you experience JavaScript heap out of memory errors:

1. Increase `NODE_MAX_OLD_SPACE_SIZE` (try 8192)
2. Review the [Memory Fix Summary](docs/MEMORY_FIX_SUMMARY.md)
3. Check Railway deployment logs

### Common Issues

- **Setup not accessible**: Verify `SETUP_PASSWORD` is set
- **Deployment failures**: Check Railway logs and volume mounting
- **Performance issues**: Monitor memory usage and adjust limits

## 📊 Monitoring

Monitor these metrics in Railway:

- **Memory Usage**: Should stay under allocated limits
- **Response Time**: Setup wizard and API responses
- **Error Rate**: Gateway startup failures
- **Health Checks**: `/setup/healthz` endpoint status

## 🔒 Security

- **Setup Authentication**: Password-protected setup wizard
- **Gateway Authentication**: Token-based API authentication
- **Volume Permissions**: Proper file permissions on `/data`
- **Network Security**: Internal gateway communication on localhost

## 📈 Scaling

- **Vertical Scaling**: Increase memory limits via environment variables
- **Horizontal Scaling**: Multiple Railway instances (each with own state)
- **Storage Management**: Automatic volume management by Railway

## 🆘 Support

For issues and support:

1. Check the [Deployment Guide](docs/DEPLOYMENT_GUIDE.md)
2. Review the [Changelog](docs/CHANGELOG.md) for known issues
3. Use `/setup/api/debug` endpoint for diagnostics
4. Check Railway deployment logs
5. Review OpenClaw documentation

## 📄 License

This project is licensed under the same terms as OpenClaw. See the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

---

**Deploy on Railway** and get your OpenClaw instance running in minutes! 🚀
