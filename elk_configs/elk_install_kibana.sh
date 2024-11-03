#!/bin/bash/
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