# Резервное копирование ELK
### Структура каталогов:
- ./backup_elk/
- ./dst_elk

### На сервере:
1. Выполнить скрипт elk_backup_configs.sh с правами root.

### На хосте:
1. Выполнить скрипт *elk_backup_configs_remote.sh*.
2. Копии файлов расположены в каталоге *./backup_elk/$(date '+%Y%m%d-%H-%M-%S')*.

