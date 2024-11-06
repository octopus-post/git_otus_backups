# MySQL

/etc/mysql/		# каталог глобальных настроек 
.
├── conf.d
│   ├── mysql.cnf			# клиентские утилиты
│   └── mysqldump.cnf			#
├── debian.cnf
├── debian-start
├── my.cnf -> /etc/alternatives/my.cnf 	# для совместимости, не трогаем
├── my.cnf.fallback
├── mysql.cnf				# содержит два инклуда conf.d и mysql.conf.d
└── mysql.conf.d			# 
    ├── mysql.cnf
    └── mysqld.cnf			# ЗДЕСЬ НАСТРАИВАЕМ СЕРВЕР

В mysql.conf.d для репликации определяет параметры сокета
> ...
> bind-address            = 0.0.0.0
> ...

/var/lib/mysql/		# каталог БД и бинлогов