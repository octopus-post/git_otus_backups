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

SOURCEPATH=/etc/apache2
rsync -e "$SSH -i $PUBKEY" --archive --verbose --progress --perms --owner --group  ${SERVERUSER}@${SERVERHOST}:${SOURCEPATH} ${DESTPATH}

SOURCEPATH=/var/www
rsync -e "$SSH -i $PUBKEY" --archive --verbose --progress --perms --owner --group  ${SERVERUSER}@${SERVERHOST}:${SOURCEPATH} ${DESTPATH}
