#!/bin/bash/

# Резервное копирование файлов конфигураций elk
#date=$(date '+%Y%m%d-%H-%M-%S')
dpath=./backup_elk/$(date '+%Y%m%d-%H-%M-%S')/
mkdir ${dpath}
mhost='192.168.122.232'
spath=/home/smith/elk_restore/backup_elk/
scp -i /home/alex/.ssh/otus_rsa smith@${mhost}:${spath}* ${dpath}
