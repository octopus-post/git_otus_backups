#!/bin/bash/
#############################################
# Установка и восстановление настроек сервисов ELK 8.9.1
echo -e "\033[32mУстановка и восстановление настроек сервисов ELK 8.9.1\033[0m"
echo -e "\033[32mУстановка java\033[0m"
apt install default-jdk -y

distribtpath=./dst_elk/elk-8.9-deb/
configpath=./backup_elk

echo -e "\033[32mУстановка es\033[0m"
dpkg -i ${distribtpath}elasticsearch-8.9.1-amd64.deb

destpath=/etc/elasticsearch/
echo -e "\033[32mИз бэкапа копируем конфиг elasticsearch и восстанавливаем права\033[0m"
cp ${configpath}elasticsearch.yml ${destpath}elasticsearch.yml
chmod 644 ${destpath}elasticsearch.yml
# 'из бэкапа копируем конфиг jvm и восстанавливаем права'
cp ${configpath}jvm.options.d/jvm.options ${destpath}jvm.options.d/jvm.options
chmod 644 ${destpath}jvm.options.d/jvm.options

echo -e "\033[32mЗапуск сервиса es\033[0m"
systemctl daemon-reload
systemctl enable --now elasticsearch.service