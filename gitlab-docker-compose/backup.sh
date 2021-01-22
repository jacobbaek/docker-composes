#!/bin/bash
NOW=`date +%y%m%d`
/usr/bin/docker exec -it gitlab gitlab-backup create BACKUP=dump GZIP_RSYNCABLE=yes
tar cvfz ./gitlab/backups/config-backup-$NOW.tar.gz ./gitlab/config/
