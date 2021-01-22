#!/bin/bash

if [ $1 == "create" ]; then
  nexus3 blobstore create file centos7-os-hosted centos7-os-hosted
  nexus3 repository create hosted yum centos7-os-hosted --blob-store-name centos7-os-hosted
  nexus3 blobstore create file centos7-os centos7-os
  nexus3 repository create proxy yum centos7-os http://mirror.kakao.com/centos/7.9.2009/os/x86_64/ --blob-store-name centos7-os --content-max-age 0 --metadata-max-age 0
  
  nexus3 blobstore create file centos7-updates-hosted centos7-updates-hosted
  nexus3 repository create hosted yum centos7-updates-hosted --blob-store-name centos7-updates-hosted
  nexus3 blobstore create file centos7-updates centos7-updates
  nexus3 repository create proxy yum centos7-updates http://mirror.kakao.com/centos/7.9.2009/updates/x86_64/ --blob-store-name centos7-updates --content-max-age 0 --metadata-max-age 0
  
  nexus3 blobstore create file centos7-extras-hosted centos7-extras-hosted
  nexus3 repository create hosted yum centos7-extras-hosted --blob-store-name centos7-extras-hosted
  nexus3 blobstore create file centos7-extras centos7-extras
  nexus3 repository create proxy yum centos7-extras http://mirror.kakao.com/centos/7.9.2009/extras/x86_64/ --blob-store-name centos7-extras --content-max-age 0 --metadata-max-age 0
  
  nexus3 blobstore create file centos7-epel-hosted centos7-epel-hosted
  nexus3 repository create hosted yum centos7-epel-hosted --blob-store-name centos7-epel-hosted
  nexus3 blobstore create file centos7-epel centos7-epel
  nexus3 repository create proxy yum centos7-epel http://mirror.kakao.com/epel/7/x86_64/ --blob-store-name centos7-epel --content-max-age 0 --metadata-max-age 0
  
  nexus3 blobstore create file ceph-nautilus-hosted ceph-nautilus-hosted
  nexus3 repository create hosted yum ceph-nautilus-hosted --blob-store-name ceph-nautilus-hosted
  nexus3 blobstore create file ceph-nautilus ceph-nautilus
  nexus3 repository create proxy yum ceph-nautilus http://mirror.kakao.com/centos/7.9.2009/storage/x86_64/ceph-nautilus --blob-store-name ceph-nautilus --content-max-age 0 --metadata-max-age 0
  
  nexus3 blobstore create file images images
  nexus3 repository create hosted raw images --blob-store-name images --cleanup-policy raw-cleanup-policy

elif [ $1 == "delete" ]; then
  for repo in $(nexus3 repo list | grep http | cut -f1 -d ' '); do nexus3 repo delete $repo --yes; done
  nexus3 repo list
  for blob in $(nexus3 blobstore list | grep File | cut -f1 -d ' '); do nexus3 blobstore delete $blob --yes; done
  nexus3 blobstore list

elif [ $1 == "policy" ]; then
  nexus3 cleanup-policy create yum-cleanup-policy --format raw --downloaded 30 --notes "delete raw files older than 30 days"
else
  echo "please provide create or delete argument"
fi
