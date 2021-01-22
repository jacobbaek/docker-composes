#!/bin/bash

NEXUSPATH=${PWD}

nexus3 login -U http://localhost:8081 -u admin -p $(cat $NEXUSPATH/admin.password) --no-x509_verify
