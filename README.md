# Docker-compose files


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
