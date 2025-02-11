#!/bin/bash

DOMAIN="test.jacobbaek.com"
FILENAME="ssl"

openssl ecparam -out $FILENAME.key -name prime256v1 -genkey
openssl req -new -sha256 -key $FILENAME.key -out $FILENAME.csr -subj "/CN=${DOMAIN}"
openssl x509 -req -sha256 -days 365 -in $FILENAME.csr -signkey $FILENAME.key -out $FILENAME.crt
