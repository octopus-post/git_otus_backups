# MySQL
Структура каталогов:
/etc/mysql/		# каталог глобальных настроек 
```
/etc/mysql/
	├── conf.d
	│   ├── mysql.cnf			# клиентские утилиты
	│   └── mysqldump.cnf			#
	├── debian.cnf
	├── debian-start
	├── my.cnf -> /etc/alternatives/my.cnf # для совместимости, не трогаем
	├── my.cnf.fallback
	├── mysql.cnf				# содержит два инклуда conf.d и mysql.conf.d
	└── mysql.conf.d			# 
	     ├── mysql.cnf
	     └── mysqld.cnf			# ЗДЕСЬ НАСТРАИВАЕМ СЕРВЕР
```

В */etc/mysql/mysql.conf.d/mysqld.conf* для репликации определяем параметры сокета
```
 ...
 bind-address            = 0.0.0.0
 ...
```
Каталог БД и бинлогов
*/var/lib/mysql/*

# Резерное копирование всех таблиц БД
1. Проверить наличие каталога *backups*
2. Выполнить скрипт *mysql_createDBBackup.sh* с параметром <ИМЯ_БД>
