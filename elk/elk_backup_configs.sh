#!/bin/bash

# Резервное копирование файлов конфигураций elk
#date=$(date '+%Y%m%d-%H-%M-%S')
dpath=./backup_elk/ #${date}/
#mkdir ${dpath}

spath=/etc/elasticsearch/
cp ${spath}elasticsearch.yml ${dpath} 
chmod 644 ${spath}elasticsearch.yml
cp ${spath}jvm.options.d/jvm.options ${dpath}
chmod 644 ${spath}jvm.options.d/jvm.options

spath=/etc/kibana/
cp ${spath}kibana.yml ${dpath}
chmod 644 ${spath}kibana.yml

spath=/etc/logstash/
cp ${spath}logstash.yml ${dpath}
chmod 644 ${spath}logstash.yml
cp ${spath}conf.d/logstash-nginx-es.conf ${dpath}
chmod 644 ${spath}conf.d/logstash-nginx-es.conf

spath=/etc/filebeat/
cp ${spath}filebeat.yml ${dpath}
chmod 644 ${spath}filebeat.yml
