#!/bin/bash

REPOLIST="centos7-os centos7-extras centos7-updates centos7-epel ceph-nautilus"
for repo in $REPOLIST
do
  cat << EOF >>/etc/yum.repos.d/$repo.repo
[$repo]
name=$repo
enabled=1
gpgcheck=0
baseurl=https://nexus.openlabs.io/repository/$repo/
EOF
done
