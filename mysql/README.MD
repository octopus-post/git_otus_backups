# MySQL 8.0. Настройка репликации.
### Файловая структура MySQL
Структура каталога глобальных настроек 
```
/etc/mysql/
	├── conf.d
	│   ├── mysql.cnf			# клиентские утилиты
	│   └── mysqldump.cnf		#
	├── debian.cnf
	├── debian-start
	├── my.cnf -> /etc/alternatives/my.cnf # для совместимости, не изменяем
	├── my.cnf.fallback
	├── mysql.cnf				# содержит два инклуда conf.d и mysql.conf.d
	└── mysql.conf.d			# 
	     ├── mysql.cnf
	     └── mysqld.cnf			# ЗДЕСЬ НАСТРАИВАЕМ СЕРВЕР
```

#### Системные настройки:

*/etc/mysql/mysql.conf.d/*

*/etc/mysql/conf.d/*

#### Каталог БД и бинлогов: 
*/var/lib/mysql/*

#### Пользовательские Настройки: 
*~/.my.cnf*

### Настройка конфигурации на сервере SOURCE:
*/etc/mysql/mysql.conf.d/mysqld.conf* 
```
[mysqld]
 ...
 bind-address            = 0.0.0.0 	#сокет для репликации
 ...
server-id = 1
log-bin = mysql-bin
binlog_format = row
gtid-mode = ON
enforce-gtid-consistency	
log-replica-updates					#для перевода source -> replica
binlog_expire_logs_seconds	=2592000	#время хранения бинлогов
```

### Настройка конфигурации на сервере REPLICA:
*/etc/mysql/mysql.conf.d/mysqld.conf* 
```
[mysqld]
 ...
server-id = 2
log-bin = mysql-bin
relay-log = relay-log-server			#лог для приёма изменений на source
read-only = ON							#запрет изменений всем кроме root 
gtid-mode = ON
enforce-gtid-consistency	
log-replica-updates					
```



