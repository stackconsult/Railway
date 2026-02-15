# Changelog

All notable changes to the OpenClaw Railway Template will be documented in this file.

## [1.1.0] - 2025-02-15

### Added
- Node.js memory configuration (4GB old space, 256MB semi-space)
- Enhanced gateway health checks with 120s timeout
- OpenClaw installation verification before startup
- Comprehensive debug endpoint at `/setup/api/debug`
- Production-ready error handling and logging
- Deployment guide and documentation

### Fixed
- **Gateway timeout errors**: "Gateway did not become available in time"
- **JavaScript heap out of memory**: During doctor command and Telegram pairing
- **OpenClaw entry point mismatch**: Corrected path to match Docker installation
- **Health check reliability**: Better endpoint order and response validation
- **Error diagnostics**: Clear error messages and troubleshooting information

### Changed
- Increased gateway startup timeout from 60s to 120s
- Improved health check intervals and request timeouts
- Enhanced debug endpoint with comprehensive system information
- Better error handling throughout the application

### Security
- Proper file permissions on `/data` directory
- Token-based gateway authentication
- Secure setup wizard with password protection

## [1.0.0] - Initial Release

### Added
- Railway deployment template for OpenClaw
- Express wrapper server with gateway management
- Setup wizard for OpenClaw configuration
- Docker-based deployment with Homebrew installation
- Volume persistence for configuration and workspace
- Health checks and monitoring
- Web-based TUI support

### Features
- Automatic OpenClaw installation and configuration
- Token-based authentication system
- WebSocket support for terminal sessions
- Proxy server for OpenClaw gateway
- Environment variable configuration
- Railway-specific optimizations

---

## Version History

### 1.1.0 - Production Ready
- **Focus**: Stability, memory management, and error handling
- **Target**: Production deployments with proper monitoring

### 1.0.0 - Initial Template
- **Focus**: Basic Railway deployment functionality
- **Target**: Development and testing environments

---

## Technical Details

### Memory Configuration (v1.1.0+)
- Default: 4GB old space, 256MB semi-space
- Configurable via `NODE_MAX_OLD_SPACE_SIZE` and `NODE_MAX_SEMI_SPACE_SIZE`
- Prevents JavaScript heap out of memory errors

### Gateway Improvements (v1.1.0+)
- 120-second startup timeout
- Installation verification
- Enhanced health checks
- Better error diagnostics

### Debug Capabilities (v1.1.0+)
- `/setup/api/debug` endpoint with system information
- Gateway status monitoring
- OpenClaw version and configuration details
- Environment variable diagnostics

---

## Migration Guide

### From 1.0.0 to 1.1.0
No migration required - changes are backward compatible. New features will be automatically enabled.

### Environment Variables
New optional variables for v1.1.0+:
- `NODE_MAX_OLD_SPACE_SIZE=4096`
- `NODE_MAX_SEMI_SPACE_SIZE=256`

### Breaking Changes
None - all changes are additive and backward compatible.
