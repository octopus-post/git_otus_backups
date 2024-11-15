# Резервное копирование ELK
### Структура каталогов:
- ./backup_elk/
- ./dst_elk

## Вариант 1 (с настроенным доступом root по сертификату)

### На хосте
1. Выполнить скрипт *elk_backup_configs_rsync.sh* с правами root:

		sudo bash ./elk_backup_configs_rsync.sh

#### Параметры в скрипте:
- SERVERHOST - ip адрес сервера
- PUBKEY - путь до файла ключа на хосте

## Вариант 2 (без доступа удаленной авторизации root)
### На сервере:
1. Выполнить скрипт *elk_backup_configs.sh* с правами root для сохранений копий на localhost.

### На хосте:
1. Выполнить скрипт *elk_backup_configs_remote.sh*.
2. Копии файлов расположены в каталоге *./backup_elk/$(date '+%Y%m%d-%H-%M-%S')*.

