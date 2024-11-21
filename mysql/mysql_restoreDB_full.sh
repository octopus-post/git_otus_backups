#!/bin/bash

DATABASE=$1
SOURCEPATH=$2

mysql -uroot -p ${DATABASE} < ${SOURCEPATH}
