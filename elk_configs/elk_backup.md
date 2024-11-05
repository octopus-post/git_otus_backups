# Резервное копирование ELK
### Структура каталогов:
- ./backup_elk/
- ./dst_elk

## Вариант 1 (с настроенным доступом root по сертификату)
### На сервере:
1. В файл /root/.ssh/authorized_keys добавить строку с ключом
2. В настройках ssh сервера в файле */etc/ssh/sshd_config* указать значение параметра
> 		... 
> 		PermitRootLogin prohibit-password
>		...

### На хосте
1. Выполнить скрипт *elk_backup_configs_rsync.sh* с правами root.
####Параметры:
- SERVERHOST - ip адрес сервера
- PUBKEY - путь до файла ключа на хосте

## Вариант 2 (без доступа удаленной авторизации root)
### На сервере:
1. Выполнить скрипт *elk_backup_configs.sh* с правами root.

### На хосте:
1. Выполнить скрипт *elk_backup_configs_remote.sh*.
2. Копии файлов расположены в каталоге *./backup_elk/$(date '+%Y%m%d-%H-%M-%S')*.

