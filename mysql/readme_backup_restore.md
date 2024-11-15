# Резерное копирование всех таблиц всех DB
#### *Список скриптов при выполнении backup/restore:*
- mysql_createDBBackup_full.sh 
- mysql_createDBBackup_inc.sh
- mysql_createDBBackup_tbls.sh
- copy_backup_from_replica.sh
- mysql_restoreDB_inc.sh > доработать для запуска с параметрами

### На сервере REPLICA:
1. Проверить статус реплики:

		mysql > show replica status\G;

2. Выполнить скрипт полного резервного копирования: 

        bash ./mysql_createDBBackup_full.sh [*|<DB_NAME>]
	>	в параметр передать имя DB, либо * - все базы.
	>
	> 	 	––flush-log инициализирует запись нового двоичного файла журнала.	
	>
	>    	––delete-master-logs удаляем старые двоичные файлы журнала.

3. Выполнить скрипт инкрементного резервного копирования в случае, если делается c разницей во времени с полным:

      	bash ./mysql_createDBBackup_inc.sh

	> При параметре в конфиге *binlog_expire_logs_seconds = 2592000* не поздее 30 дней после полного резервного копирования

### На сервере BACKUPS:

1. Копировать каталог с резервными копиями с сервера REPLICA:

		bash ./copy_backup_from_replica.sh

# Восстановление DB из резервной копии
### На сервере SOURCE:

1. Копировать каталог с резервными копиями:
		
		bash ./copy_backup_from_replica.sh

2. В файлах *.sql закомментировать строку 

		...
		/*SET @@GLOBAL.GTID_PURGED=...*/
		...

3. Выполнить скрипт восстановления DB

	> !NB закончить скрипт полного восстановления иэ бэкапа
	>
	> mysqldump -uroot -h82.82.82.82 -p -A > all-databases.sql
		
		bash ./mysql_restoreDB_full.sh [*|<DB_NAME>]

	>	в параметр передать имя DB, либо * - все базы.
	>
		
4. Если необходимо выполнить загрузку инкрементной копии, выполнить:

		bash mysql_restoreDB_inc.sh

### На сервере REPLICA:

1. В файле дампа *.sql каждой базы раскомментировать строку для загрузки с сервера SOURCE данных после последнего резервного копирования реплики:

			...
			SET @@GLOBAL.GTID_PURGED=...
			...

2. Выполнить восстановление резервной копии:
		
			bash mysql_restoreDB_full.sh


При полном восстановлении реплики очистить GTID:
		mysql > RESET MASTER;



## Point-in-Time Recovery 

восстановление на определенный момент времени

> Раздел в доработке


9.5.1 Point-in-Time Recovery Using Binary Log

9.5.2 Point-in-Time Recovery Using Event Positions

[MySQL: https://dev.mysql.com/doc/refman/5.7/en/mysqldump.html](https://dev.mysql.com/doc/refman/5.7/en/mysqldump.html)
