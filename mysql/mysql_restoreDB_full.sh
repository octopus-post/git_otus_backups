#!/bin/bash/

SOURCEPATH=./logs/
DATABASE=$1

mysqlbinlog $(ls ${SOURCEPATH}) -d ${DATABASE} | mysql -u root