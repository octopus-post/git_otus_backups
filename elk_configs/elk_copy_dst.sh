#!/bin/bash/
# копирование дистрибутивов на сервер
scp -r -i /home/alex/.ssh/otus_rsa ./dst_elk/elk-8.9-deb smith@192.168.122.232:/home/smith/elk_restore/

# копирование конфигов на сервер
scp -r -i /home/alex/.ssh/otus_rsa ./backup_elk smith@192.168.122.232:/home/smith/elk_restore/
# копирование скриптов
scp -i /home/alex/.ssh/otus_rsa ./* smith@192.168.122.232:/home/smith/elk_restore/
