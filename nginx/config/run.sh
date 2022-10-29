#!/bin/bash

echo "Selected Profiles: $COMPOSE_PROFILES"

if [ "$COMPOSE_PROFILES" = "go" ] || [ "$COMPOSE_PROFILES" = "all" ]; then
  echo "Starting Python Web Server"
  export GO_WEB_CONFIG="$(cat /config/locations/web-go.conf)"
else
  echo "Skipping Go Web Server"
  export GO_WEB_CONFIG=''
fi

if [ "$COMPOSE_PROFILES" = "python" ] || [ "$COMPOSE_PROFILES" = "all" ]; then
  echo "Starting Go Web Server"
  export PY_WEB_CONFIG="$(cat /config/locations/web-py.conf)"
else
  echo "Skipping Python Web Server"
  export PY_WEB_CONFIG=''
fi

envsubst '$${GO_WEB_CONFIG} $${PY_WEB_CONFIG}' < /etc/nginx/templates/default.conf.template > /etc/nginx/conf.d/default.conf

echo -e "\nContainer DNS configs"
cat /etc/resolv.conf

echo -e "\nConfigured Nginx conf"
cat /etc/nginx/conf.d/default.conf

echo -e "\nStarting Nginx"
nginx -g 'daemon off;'
