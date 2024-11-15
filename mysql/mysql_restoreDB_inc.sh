#!/bin/bash/

SOURCEPATH=./logs/
DATABASE=$1

mysqlbinlog  -d ${DATABASE} $(ls ${SOURCEPATH}) | mysql -u root