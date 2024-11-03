#!/bin/bash/
# копирование дистрибутивов на сервер
scp -r ./dst_elk/elk-8.9-deb smith@192.168.122.155:/home/smith/db/

# копирование конфигов на сервер
scp -r ./backup_elk smith@192.168.122.155:/home/smith/db/
