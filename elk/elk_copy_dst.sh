#!/bin/bash
# копирование дистрибутивов на сервер
scp -r -i ~/.ssh/otus_rsa ./dst_elk/elk-8.9-deb root@192.168.122.232:/home/smith/elk_restore/
# копирование конфигов на сервер
scp -r -i ~/.ssh/otus_rsa ./backup_elk root@192.168.122.232:/home/smith/elk_restore/
# копирование скриптов
scp -i ~/.ssh/otus_rsa ./* root@192.168.122.232:/home/smith/elk_restore/
