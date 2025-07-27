#!/bin/sh

#----#
# placeholder for testing
# while true; do sleep 1; done
#----#

# check if /data/Caddyfile exists, copy across if not
if [ ! -f /data/Caddyfile ]; then
  echo "no Caddyfile detected, copying across default config"
  cp /staging/Caddyfile /data/Caddyfile
fi

# inject runtime configuration for URL and API key if provided
cat <<EOF >/web/env.js
window.headscaleConfig = {
  url: "${HEADSCALE_URL}",
  apiKey: "${HEADSCALE_API_KEY}"
};
EOF

echo "Starting Caddy"
/usr/sbin/caddy run --adapter caddyfile --config /data/Caddyfile
