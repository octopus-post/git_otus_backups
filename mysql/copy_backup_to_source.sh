#!/bin/bash/

SSH=/usr/bin/ssh
#DATE=$(date '+%Y%m%d-%H-%M-%S')
SOURCEPATH=/home/alex/ED/basic_finalwork/git_otus_backups/mysql/db/
DESTPATH=/home/smith/backups/
#mkdir ${DESTPATH}
SERVERUSER=root
SERVERHOST=192.168.122.201
PUBKEY='/home/alex/.ssh/otus_rsa'


rsync -e "$SSH -i $PUBKEY" --verbose --progress --perms --owner --group -r ${SOURCEPATH} ${SERVERUSER}@${SERVERHOST}:${DESTPATH}
