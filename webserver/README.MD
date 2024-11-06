# Резервные копии веб-сервера NGINX-APACHE2
## Вариант 1 (с настроенным доступом root по сертификату)
### На сервере:
1. В файл /root/.ssh/authorized_keys добавить строку с ключом
2. В настройках ssh сервера в файле */etc/ssh/sshd_config* указать значение параметра
> 		... 
> 		PermitRootLogin prohibit-password
>		...

### На хосте
1. Выполнить скрипт *webserever_backup.sh* с правами root.
