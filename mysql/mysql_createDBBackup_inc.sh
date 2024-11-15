#!/bin/bash
#============================
#Создание инкрементного бэкапа
#============================

mysql -e 'STOP REPLICA'

#путь к файлу с двоичными журналами
BINLOGS_PATH=/var/lib/mysql/

#проверить каталог для бэкапа бинлогов. если отсутствует, то создать
BACKUP_FOLDER=$(pwd)'/backups/

if [ -d "$BACKUP_FOLDER" ]; then
	echo 'Каталог для бэкапа бд найден: ' $BACKUP_FOLDER
else
        mkdir -p $BACKUP_FOLDER
        echo 'Создан каталог для бэкапа бд: ' $BACKUP_FOLDER
fi

#создаем новый двоичный журнал
mysql -E --execute='FLUSH BINARY LOGS;'
#получаем список бинлогов
BINLOGS=$(sudo mysql -E --execute='SHOW BINARY LOGS;' | grep Log_name | sed -e 's/Log_name://g' -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
#берем все, кроме последнего
BINLOGS_WITHOUT_LAST=`echo "${BINLOGS}" | head -n -1`
#отдельно последний, который не нужно копировать
BINLOG_LAST=`echo "${BINLOGS}" | tail -n -1`
#формируем полный путь 
BINLOGS_FULLPATH=`echo "${BINLOGS_WITHOUT_LAST}" | xargs -I % echo ${BINLOGS_PATH}%`
#копируем бинлоги
cp ${BINLOGS_FULLPATH}* ${BACKUP_FOLDER}
#или делаем архив бинлогов
#zip ${BACKUP_FOLDER}/$(date +%d-%m-%Y_%H-%M-%S).zip ${BINLOGS_FULLPATH}
#echo ${BINLOGS_FULLPATH} | xargs tar -zcf ${BACKUP_FOLDER}$(date +%d-%m-%Y_%H-%M-%S).tar.gz

#удаляем сохраненные файлы журналов
echo ${BINLOG_LAST} | xargs -I % sudo mysql -E --execute='PURGE BINARY LOGS TO "%";' mysql

mysql -e 'START REPLICA'
