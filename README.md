# Docker-compose files
Some of [service](https://github.com/jacobbaek/docker-composes#how-to-use) can deploy by these docker-compose.

# Keep to know
All these docker-compose yaml file has root privilege, it means you never use at the production.

# How to use

* create and start (or update)
  ```
  docker-compose up -d
  ```
* stop
  ```
  docker-compose stop
  ```
* delete
  ```
  docker-compose down
  ```
  > it doesn't delete the volume. so if you want delete clearly, delete volume that was mounted.

# components
* jenkins with selenium agent
* jenkins with docker that will used with DooD mode
* keycloak with postgres
* nexus
* openldap
* gitlab
* redis
* rabbitmq
* grafana
* prometheus
* nginx-proxy
* loki
