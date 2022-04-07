# gitlab installation with docker-compose

# preparing to install 
- copy the certificate (crt, key) into /etc/cert/ssl/ 

# backup and restore
* docker-compose has option that can backup periodically.
* if you want to run backup just once, run below command.
  ```
  gitlab-rake gitlab:backup:create
  ```
# gitlab-runner
gitlab-runner container does not have gitlab server information.
so, have to run below command at the container shell.
```
REG_TOKEN=XXXXXXXXXXXXXXX
gitlab-runner register -n "dind-gitlab-runner" \
  --url https://gitlab.jacobbaek.com/ \
  --registration-token REG_TOKEN \
  --executor docker \
  --description "dind-runner" \
  --docker-image "docker:latest" \
  --docker-privileged
```
