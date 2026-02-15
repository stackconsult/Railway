# OpenClaw Memory Issue Fix Summary

## Problem
OpenClaw Railway deployment was experiencing JavaScript heap out of memory errors during:
- `openclaw-doctor` command execution
- Telegram pairing approval process
- Other memory-intensive operations

Error messages included:
- `FATAL ERROR: CALL_AND_RETRY_LAST Allocation failed - JavaScript heap out of memory`
- `FATAL ERROR: Reached heap limit Allocation failed - JavaScript heap out of memory`

## Root Cause
Node.js was using default V8 heap limits (typically 512MB-2GB) without any memory configuration, causing crashes during intensive operations.

## Solution Implemented

### 1. Updated Memory Configuration
- **Default limits**: 4GB old space, 256MB semi-space
- **Configurable** via environment variables:
  - `NODE_MAX_OLD_SPACE_SIZE=4096` (default)
  - `NODE_MAX_SEMI_SPACE_SIZE=256` (default)

### 2. Files Modified

#### `entrypoint.sh`
```bash
# Before:
exec gosu openclaw node src/server.js

# After:
exec gosu openclaw node --max-old-space-size=${NODE_MAX_OLD_SPACE_SIZE:-4096} --max-semi-space-size=${NODE_MAX_SEMI_SPACE_SIZE:-256} src/server.js
```

#### `src/server.js`
- Added `parseNodeCommand()` function to handle Node.js arguments properly
- Updated `OPENCLAW_NODE` default to include memory flags
- Modified all spawn calls:
  - Gateway process spawn
  - `runCmd()` function 
  - PTY spawn for TUI

#### `.env.example`
- Updated documentation with new memory configuration options
- Added examples of environment variables for customization

### 3. Key Changes
1. **Memory limits now applied to all Node.js processes**:
   - Main server process
   - OpenClaw gateway process
   - OpenClaw CLI commands (doctor, pairing, etc.)
   - TUI terminal sessions

2. **Backward compatibility maintained**:
   - Existing `OPENCLAW_NODE` environment variable still works
   - New memory variables are optional with sensible defaults

3. **Flexible configuration**:
   - Can override memory limits per deployment
   - Environment variables work in Railway dashboard

## Testing
- ✅ Syntax validation passed
- ✅ Memory flags properly parsed
- ✅ Server starts without errors
- ✅ All spawn calls updated correctly

## Deployment Instructions
1. Deploy the updated code to Railway
2. Optionally set custom memory limits in Railway Variables:
   ```
   NODE_MAX_OLD_SPACE_SIZE=4096
   NODE_MAX_SEMI_SPACE_SIZE=256
   ```
3. The fix will automatically apply to all OpenClaw processes

## Expected Results
- No more JavaScript heap out of memory errors
- Stable operation during intensive operations
- Better performance for memory-intensive tasks
- Configurable memory limits for different deployment sizes

## Railway-Specific Notes
- Railway provides volume-mounted storage at `/data`
- Memory limits are configurable per deployment
- The fix integrates seamlessly with Railway's environment variable system
