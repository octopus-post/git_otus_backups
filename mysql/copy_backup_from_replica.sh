#!/bin/bash

# Копирование бэкапа с реплики
SSH=/usr/bin/ssh
SOURCEPATH=~/backups/
DESTPATH=$(pwd)/backups/
#mkdir ${DESTPATH}
SERVERUSER=root
SERVERHOST=192.168.122.211
PUBKEY='~/.ssh/otus_rsa'

rsync -e "$SSH -i $PUBKEY" --verbose --progress --perms --owner --group -r ${SERVERUSER}@${SERVERHOST}:${SOURCEPATH} ${DESTPATH}


