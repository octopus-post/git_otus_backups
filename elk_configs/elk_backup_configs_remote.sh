#!/bin/bash/

# Резервное копирование файлов конфигураций elk
date=$(date '+%Y%m%d-%H-%M-%S')
dpath=./backup_elk/${date}/
mkdir ${dpath}

spath=/etc/elasticsearch/
scp -i /home/alex/.ssh/otus_rsa smith@192.168.122.155:${spath}elasticsearch.yml ${dpath}
scp -i /home/alex/.ssh/otus_rsa smith@192.168.122.155:${spath}jvm.options.d/jvm.options ${dpath}

spath=/etc/kibana/
scp -i /home/alex/.ssh/otus_rsa smith@192.168.122.155:${spath}kibana.yml ${dpath}

spath=/etc/logstash/
scp -i /home/alex/.ssh/otus_rsa smith@192.168.122.155:${spath}logstash.yml ${dpath}
scp -i /home/alex/.ssh/otus_rsa smith@192.168.122.155:${spath}conf.d/logstash-nginx-es.conf ${dpath}

spath=/etc/filebeat/
scp -i /home/alex/.ssh/otus_rsa smith@192.168.122.155:${spath}filebeat.yml ${dpath}