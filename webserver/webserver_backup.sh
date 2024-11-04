#!/bin/bash/

# Резервное копирование файлов конфигураций nginx, apache2
SSH=/usr/bin/ssh
DATE=$(date '+%Y%m%d-%H-%M-%S')
DESTPATH=./backup_config/${DATE}/
mkdir ${DESTPATH}
SERVERUSER=root
SERVERHOST=192.168.122.155
PUBKEY='/home/alex/.ssh/otus_rsa'

SOURCEPATH=/etc/nginx
rsync -e "$SSH -i $PUBKEY" --archive --verbose --progress --perms --owner --group  ${SERVERUSER}@${SERVERHOST}:${SOURCEPATH} ${DESTPATH}
#rsync -e "$SSH -i $PUBKEY" --archive --verbose --progress --perms --owner --group  ${SERVERUSER}@${SERVERHOST}:${SOURCEPATH}sites-available/ ${DESTPATH}

SOURCEPATH=/etc/apache2
rsync -e "$SSH -i $PUBKEY" --archive --verbose --progress --perms --owner --group  ${SERVERUSER}@${SERVERHOST}:${SOURCEPATH} ${DESTPATH}

#SOURCEPATH=/etc/logstash/
#rsync -e "$SSH -i $PUBKEY" --verbose --progress --perms --owner --group  ${SERVERUSER}@${SERVERHOST}:${SOURCEPATH}logstash.yml ${DESTPATH}
#rsync -e "$SSH -i $PUBKEY" --verbose --progress --perms --owner --group  ${SERVERUSER}@${SERVERHOST}:${SOURCEPATH}conf.d/logstash-nginx-es.conf ${DESTPATH}

#SOURCEPATH=/etc/filebeat/
#rsync -e "$SSH -i $PUBKEY" --verbose --progress --perms --owner --group  ${SERVERUSER}@${SERVERHOST}:${SOURCEPATH}filebeat.yml ${DESTPATH}
