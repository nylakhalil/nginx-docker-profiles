# Nginx Docker Profiles

Configures Nginx conf based on enabled [Docker Compose profiles](https://docs.docker.com/compose/profiles/). Quick development environment workaround for Nginx `host not found in upstream` error when using Docker profiles. 

```sh
nginx   | Starting Nginx
nginx   | 2022/10/29 20:36:15 [emerg] 16#16: host not found in upstream "web-go" in /etc/nginx/conf.d/default.conf:12
nginx   | nginx: [emerg] host not found in upstream "web-go" in /etc/nginx/conf.d/default.conf:12
```

## Docker Compose

### All
```sh
COMPOSE_PROFILES=all docker compose up --build
```

```sh
COMPOSE_PROFILES=all docker compose down
```

### Go
```sh
COMPOSE_PROFILES=go docker compose up --build
```

```sh
COMPOSE_PROFILES=go docker compose down
```

### Python
```sh
COMPOSE_PROFILES=python docker compose up --build
```

```sh
COMPOSE_PROFILES=python docker compose down
```
