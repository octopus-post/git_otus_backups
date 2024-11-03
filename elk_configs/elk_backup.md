# Резервное копирование ELK
Структура каталого:
	./backup_elk/
	./dst_elk

### На хосте:
1. Выполнить скрипт elk_backup_configs_remote.sh
2. Копии файлов расположены в каталоге ./backup_elk/$(date '+%Y%m%d-%H-%M-%S')

