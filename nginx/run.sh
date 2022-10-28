#!/bin/bash

echo "Selected Profiles: $COMPOSE_PROFILES"

read -r -d '' GO_WEB_CONFIG <<-EOF
    location /go {
        proxy_pass      http://web-go:3000;
  }

EOF

read -r -d '' PY_WEB_CONFIG <<-EOF
    location /python {
        proxy_pass      http://web-py:3001;
  }
  
EOF

if [ "$COMPOSE_PROFILES" = "go" ] || [ "$COMPOSE_PROFILES" = "all" ]; then
  echo "Starting Python Web Server"
  export GO_WEB_CONFIG="$GO_WEB_CONFIG"
else
  echo "Skipping Go Web Server"
  export GO_WEB_CONFIG=''
fi

if [ "$COMPOSE_PROFILES" = "python" ] || [ "$COMPOSE_PROFILES" = "all" ]; then
  echo "Starting Python Web Server"
  export PY_WEB_CONFIG="$PY_WEB_CONFIG"
else
  echo "Skipping Python Web Server"
  export PY_WEB_CONFIG=''
fi

envsubst '$${GO_WEB_CONFIG} $${PY_WEB_CONFIG}' < /etc/nginx/templates/default.conf.template > /etc/nginx/conf.d/default.conf

echo "Starting Nginx"
nginx -g 'daemon off;'
