#!/bin/bash
#============================
#Создание потабличных бэкапов
#============================
MYSQL='mysql --skip-column-names'
DBNAME=$1
mysql -e 'STOP REPLICA'
#цикл по базам данных c названием из параметра скрипта
#for s in `$MYSQL -e "SHOW DATABASES LIKE '${DBNAME}';"`;
for s in `$MYSQL -e "SHOW DATABASES;"`;
	do
	echo 'База данных: ' $s;
	#проверить каталог для бэкапа бд. если отсутствует, то создать
	nameDir=$(pwd)'/backups/'$s

	if [ -d "$nameDir" ]; then
		echo 'Каталог для бэкапа бд найден: ' $nameDir
	else
		mkdir -p $nameDir
		echo 'Создан каталог для бэкапа бд: ' $nameDir
	fi

	# выполняем полную резервную копию базы
	# --flush-logs инициализирует запись нового двоичного файла журнала
	# ––delete-master-logs удаляем старые двоичные файлы журнала
	# --set-gtid-purge=COMMENTED для подготовки бэкапа для SOURCE выключаем GTID 
	# --set-gtid-purge=ON  для подготовки бэкапа для REPLICA

	mysqldump --set-gtid-purged=COMMENTED --flush-logs --delete-master-logs $s > $nameDir'/backup_'$(date '+%Y%m%d')'_'$s'.sql';

	done

mysql -e 'START REPLICA'

