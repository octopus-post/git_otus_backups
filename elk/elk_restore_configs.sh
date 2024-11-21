#!/bin/bash/

# Восстановление файлов конфигураций elk
SPATH=./backup_elk/

DPATH=/etc/elasticsearch/
cp ${SPATH}elasticsearch.yml ${DPATH} 
chmod 644 ${DPATH}elasticsearch.yml
cp ${SPATH}jvm.options.d/jvm.options ${DPATH}
chmod 644 ${DPATH}jvm.options.d/jvm.options
systemctl daemon-reload
systemctl enable --now elasticsearch.service

DPATH=/etc/kibana/
cp ${SPATH}kibana.yml ${DPATH}
chmod 644 ${DPATH}kibana.yml
sudo systemctl daemon-reload
sudo systemctl enable --now kibana.service

DPATH=/etc/logstash/
cp ${SPATH}logstash.yml ${DPATH}
chmod 644 ${DPATH}logstash.yml
cp ${SPATH}conf.d/logstash-nginx-es.conf ${DPATH}
chmod 644 ${DPATH}conf.d/logstash-nginx-es.conf
systemctl enable --now logstash.service

DPATH=/etc/filebeat/
cp ${SPATH}filebeat.yml ${DPATH}
chmod 644 ${SPATH}filebeat.yml
systemctl enable --now filebeat
