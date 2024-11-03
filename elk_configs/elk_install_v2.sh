#!/bin/bash/
# копирование дистрибутивов
scp -r /home/alex/ED/less19_db/dst_elk/elk-8.9-deb smith@192.168.122.155:/home/smith/db/

# копирование конфигов
scp -r /home/alex/ED/less19_db/backup_elk smith@192.168.122.155:/home/smith/db/

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
cp ${configpath}${destpath}elasticsearch.yml ${destpath}elasticsearch.yml
chmod 644 ${destpath}elasticsearch.yml
# 'из бэкапа копируем конфиг jvm и восстанавливаем права'
cp ${configpath}${destpath}jvm.options.d/jvm.options ${destpath}jvm.options.d/jvm.options
chmod 644 ${destpath}jvm.options.d/jvm.options

echo -e "\033[32mЗапуск сервиса es\033[0m"
systemctl daemon-reload
systemctl enable --now elasticsearch.service
#############################################
echo -e "\033[32mУстановка kibana\033[0m"
dpkg -i ${distribtpath}kibana-8.9.1-amd64.deb
echo -e "\033[32mзапуск сервиса kibana\033[0m"
systemctl daemon-reload
systemctl enable --now kibana.service

destpath=/etc/kibana/
echo -e "\033[32mиз бэкапа копируем конфиг kibana и восстанавливаем права\033[0m"
cp ${configpath}${destpath}kibana.yml ${destpath}kibana.yml
chmod 644 ${destpath}kibana.yml
echo -e "\033[32mперезапуск сервиса kibana\033[0m"
systemctl restart kibana
#############################################
echo -e "\033[32mУстановка Logstash\033[0m"
dpkg -i logstash-8.9.1-amd64.deb
echo -e "\033[32mзапуск сервиса logstash\033[0m"
systemctl enable --now logstash.service

destpath=/etc/logstash/
echo -e "\033[32mиз бэкапа копируем конфиг logstash и восстанавливаем права\033[0m"
cp ${configpath}${destpath}logstash.yml ${destpath}logstash.yml
chmod 644 ${destpath}logstash.yml
cp ${configpath}${destpath}conf.d/logstash-nginx-es.conf ${destpath}conf.d/logstash-nginx-es.conf
chmod 644 ${destpath}conf.d/logstash-nginx-es.conf
echo -e "\033[32mперезапуск сервиса logstash\033[0m"
systemctl restart logstash.service
#############################################
echo -e "\033[32mУстановка filebeat\033[0m"
dpkg -i filebeat-8.9.1-amd64.deb 
echo -e "\033[32mзапуск сервиса filebeat\033[0m"
echo 'запуск сервиса filebeat'
systemctl enable --now filebeat.service
destpath=/etc/filebeat/
cp ${configpath}${destpath}filebeat.yml ${destpath}filebeat.yml
chmod 644 ${destpath}filebeat.yml
echo -e "\033[32mперезапуск сервиса filebeat\033[0m"
echo 'перезапуск сервиса filebeat'
systemctl restart filebeat
