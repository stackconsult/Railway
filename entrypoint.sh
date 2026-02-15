#!/bin/bash
set -e

chown -R openclaw:openclaw /data

if [ ! -d /data/.linuxbrew ]; then
  cp -a /home/linuxbrew/.linuxbrew /data/.linuxbrew
fi

rm -rf /home/linuxbrew/.linuxbrew
ln -sfn /data/.linuxbrew /home/linuxbrew/.linuxbrew

exec gosu openclaw node --max-old-space-size=${NODE_MAX_OLD_SPACE_SIZE:-4096} --max-semi-space-size=${NODE_MAX_SEMI_SPACE_SIZE:-256} src/server.js
