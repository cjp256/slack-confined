#!/bin/bash

# Migrate user data from classic (or deb).
set -x

REAL_HOME="$(getent passwd $(id -u) | cut -d ':' -f 6)"
CLASSIC_CONFIG="$REAL_HOME/.config/Slack"
STRICT_SNAP_CONFIG="$SNAP_USER_DATA/.config/Slack"

if [ -d "$CLASSIC_CONFIG" ] && [ ! -d "$STRICT_SNAP_CONFIG" ]; then
  echo "migrating user config..."
  cp -ar "$CLASSIC_CONFIG" "$STRICT_SNAP_CONFIG"
fi

exec ${SNAP}/usr/bin/slack --no-sandbox
