#!/bin/bash/

# Резервное копирование файлов конфигураций elk
SSH=/usr/bin/ssh
DATE=$(date '+%Y%m%d-%H-%M-%S')
DESTPATH=./backup_elk/${DATE}/
mkdir ${DESTPATH}
SERVERUSER=root
SERVERHOST=192.168.122.232
PUBKEY='/home/alex/.ssh/otus_rsa'

SOURCEPATH=/etc/elasticsearch/
rsync -e "$SSH -i $PUBKEY" --verbose --progress --perms --owner --group  ${SERVERUSER}@${SERVERHOST}:${SOURCEPATH}elasticsearch.yml ${DESTPATH}
rsync -e "$SSH -i $PUBKEY" --verbose --progress --perms --owner --group  ${SERVERUSER}@${SERVERHOST}:${SOURCEPATH}jvm.options.d/jvm.options ${DESTPATH}

SOURCEPATH=/etc/kibana/
rsync -e "$SSH -i $PUBKEY" --verbose --progress --perms --owner --group  ${SERVERUSER}@${SERVERHOST}:${SOURCEPATH}kibana.yml ${DESTPATH}

SOURCEPATH=/etc/logstash/
rsync -e "$SSH -i $PUBKEY" --verbose --progress --perms --owner --group  ${SERVERUSER}@${SERVERHOST}:${SOURCEPATH}logstash.yml ${DESTPATH}
rsync -e "$SSH -i $PUBKEY" --verbose --progress --perms --owner --group  ${SERVERUSER}@${SERVERHOST}:${SOURCEPATH}conf.d/logstash-nginx-es.conf ${DESTPATH}

SOURCEPATH=/etc/filebeat/
rsync -e "$SSH -i $PUBKEY" --verbose --progress --perms --owner --group  ${SERVERUSER}@${SERVERHOST}:${SOURCEPATH}filebeat.yml ${DESTPATH}
