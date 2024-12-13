# Выполнение резерного копирования DB и восстановления данных.

*Используемые инструменты:*

- mysqldump
- mysqlbinlog

#### *Список скриптов при выполнении backup/restore:*
- mysql_createDBBackup_full.sh 
- mysql_createDBBackup_inc.sh
- mysql_createDBBackup_tbls.sh
- copy_backup_from_replica.sh
- mysql_restoreDB_full.sh
- mysql_restoreDB_inc.sh 
> доработать для запуска с параметрами

### На сервере REPLICA:
1. Проверить статус реплики:

```bash
mysql > show replica status\G;
```
2. Выполнить полное резервное копирование: 
```bash
bash ./mysql_createDBBackup_full.sh <*>|<DB_NAME>
```

>	в параметр передать имя DB, либо * - все базы.
  >
> 	––flush-log инициализирует запись нового файла binlog
  >
>   ––delete-master-logs удаляет старые binlog

 *Задача выполнения резервного копирования full в cron (1 раз в сутки):*
```bash
0 0 * * * sudo bash /home/smith/db/mysql_createDBBackup_full.sh *
```
3. Выполнить инкрементное резервное копирование:
```bash
bash ./mysql_createDBBackup_inc.sh
```
 *Задача выполнения резервного копирования inc в cron (1 раз в час):*
```bash
0 * * * * sudo bash /home/smith/db/mysql_createDBBackup_full.sh *
```	
> При параметре в конфиге *binlog_expire_logs_seconds = 2592000* не поздее 30 дней после полного резервного копирования

### На сервере BACKUPS:

1. Копировать каталог с резервными копиями с сервера REPLICA:
```bash
bash ./copy_backup_from_replica.sh
```
# Восстановление DB из резервной копии
### На сервере SOURCE:

1. Копировать каталог с резервными копиями:
```bash		
bash ./copy_backup_from_replica.sh
```
2. В файлах *.sql закомментировать строку 
```
		...
		/*SET @@GLOBAL.GTID_PURGED=...*/
		...
```
3. Выполнить скрипт восстановления DB
```bash
bash ./mysql_restoreDB_full.sh <*>|<DB_NAME> <PATH_TO_DUMP>
```
>	в параметр передать имя DB, либо * - все базы,
  >
>	имя файла дампа DB.
		
4. Выполнить загрузку инкрементной копии:
```bash
		bash mysql_restoreDB_inc.sh <*>|<DB_NAME> <PATH_TO_BINLOGS>
```
>	в параметр передать имя DB, либо * - все базы,
  >
>	путь к файлам бинлогов.

### При восстановлении данных сервере REPLICA:

1. В файле дампа *.sql каждой базы раскомментировать строку для загрузки с сервера SOURCE данных после последнего резервного копирования реплики:
```
		...
		SET @@GLOBAL.GTID_PURGED=...
		...
```
2. Выполнить восстановление полной резервной копии:
```bash		
bash mysql_restoreDB_full.sh
```

3. Очистить GTID:
```bash	
mysql > RESET MASTER;
```
## Point-in-Time Recovery 

восстановление на определенный момент времени

> Раздел в доработке


9.5.1 Point-in-Time Recovery Using Binary Log

9.5.2 Point-in-Time Recovery Using Event Positions

[MySQL: https://dev.mysql.com/doc/refman/5.7/en/mysqldump.html](https://dev.mysql.com/doc/refman/5.7/en/mysqldump.html)
