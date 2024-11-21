#!/bin/bash

SSH=/usr/bin/ssh
#DATE=$(date '+%Y%m%d-%H-%M-%S')
SOURCEPATH=~/ED/basic_finalwork/git_otus_backups/mysql/db/
DESTPATH=~/backups/
#mkdir ${DESTPATH}
SERVERUSER=root
SERVERHOST=192.168.122.201
PUBKEY='~/.ssh/otus_rsa'


rsync -e "$SSH -i $PUBKEY" --verbose --progress --perms --owner --group -r ${SOURCEPATH} ${SERVERUSER}@${SERVERHOST}:${DESTPATH}
