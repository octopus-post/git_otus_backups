#!/bin/bash
#============================
#Создание потабличных бэкапов
#============================
MYSQL='mysql --skip-column-names'
DBNAME=$1
mysql -e 'STOP REPLICA'
#цикл по базам данных c названием из параметра скрипта
for s in `$MYSQL -e "SHOW DATABASES LIKE '${DBNAME}';"`;
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
	#цикл по таблицам бд
	for t in `$MYSQL --database=$s -e "SHOW TABLES;"`;
		do
		echo '-Таблица: ' $s / $t;
		#бэкап таблицы
		/usr/bin/mysqldump $s $t > $nameDir'/backup_'$(date '+%Y%m%d')'_'$s'-'$t'.sql';
		done
	done
mysql -e 'START REPLICA'

