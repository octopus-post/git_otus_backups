#!/bin/bash/
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