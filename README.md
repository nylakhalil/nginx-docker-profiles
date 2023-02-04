# Nginx Docker Profiles

Nginx conf based on enabled [Docker Compose profiles](https://docs.docker.com/compose/profiles/). Quick development environment configs for Nginx [host not found in upstream error](https://stackoverflow.com/questions/32845674/setup-nginx-not-to-crash-if-host-in-upstream-is-not-found) when using Docker profiles. The container endpoint [domain names are specified in a variable](https://www.nginx.com/blog/dns-service-discovery-nginx-plus/) along with a resolver directive.

```sh
nginx   | Starting Nginx
nginx   | 2022/10/29 20:36:15 [emerg] 16#16: host not found in upstream "web-go" in /etc/nginx/conf.d/default.conf:12
nginx   | nginx: [emerg] host not found in upstream "web-go" in /etc/nginx/conf.d/default.conf:12
```

## Docker Compose

Available on [http://localhost/](http://localhost/)

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

### Rust
```sh
COMPOSE_PROFILES=rust docker compose up --build
```

```sh
COMPOSE_PROFILES=rust docker compose down
```