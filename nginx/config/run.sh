#!/bin/bash

echo -e "\nContainer DNS configs"
cat /etc/resolv.conf

echo -e "\nSelected Profiles: $COMPOSE_PROFILES"

echo -e "\nSubstituting values of environment variables"
envsubst '$${DNS_RESOLVER_IP}' < /etc/nginx/templates/default.conf.template > /etc/nginx/conf.d/default.conf

echo -e "\nConfigured Nginx conf"
cat /etc/nginx/conf.d/default.conf

echo -e "\nStarting Nginx"
nginx -g 'daemon off;'
