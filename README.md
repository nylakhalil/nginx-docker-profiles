# Nginx Docker Profiles

Configures Nginx conf based on enabled [Docker Compose profiles](https://docs.docker.com/compose/profiles/). Useful for development environments.

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
