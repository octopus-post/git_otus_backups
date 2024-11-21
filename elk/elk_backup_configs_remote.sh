#!/bin/bash

# Резервное копирование файлов конфигураций elk
#date=$(date '+%Y%m%d-%H-%M-%S')
DPATH=./backup_elk/$(date '+%Y%m%d-%H-%M-%S')/
mkdir ${DPATH}
mhost='192.168.122.232'
SPATH=~/elk_restore/backup_elk/
scp -i ~/.ssh/otus_rsa smith@${mhost}:${SPATH}* ${DPATH}
