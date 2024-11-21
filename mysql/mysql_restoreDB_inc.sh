#!/bin/bash

DATABASE=$1
SOURCEPATH=$2 

BINLOGS_LIST=`echo "$(ls ${SOURCEPATH})" | xargs -I % echo ${SOURCEPATH}%`

mysqlbinlog  -d ${DATABASE} ${BINLOGS_LIST} | mysql -u root
