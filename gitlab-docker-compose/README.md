# gitlab installation with docker-compose

# preparing to install 
- copy the certificate (crt, key) into /etc/cert/ssl/ 

# backup and restore
* docker-compose has option that can backup periodically.
* if you want to run backup just once, run below command.
  ```
  gitlab-rake gitlab:backup:create
  ```
