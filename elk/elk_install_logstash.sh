#!/bin/bash
#############################################
distribtpath=./dst_elk/elk-8.9-deb/
configpath=./backup_elk

echo -e "\033[32mУстановка Logstash\033[0m"
dpkg -i ${distribtpath}logstash-8.9.1-amd64.deb
echo -e "\033[32mзапуск сервиса logstash\033[0m"
systemctl enable --now logstash.service

destpath=/etc/logstash/
echo -e "\033[32mиз бэкапа копируем конфиг logstash и восстанавливаем права\033[0m"
cp ${configpath}logstash.yml ${destpath}logstash.yml
chmod 644 ${destpath}logstash.yml
cp ${configpath}conf.d/logstash-nginx-es.conf ${destpath}conf.d/logstash-nginx-es.conf
chmod 644 ${destpath}conf.d/logstash-nginx-es.conf
echo -e "\033[32mперезапуск сервиса logstash\033[0m"
systemctl restart logstash.service