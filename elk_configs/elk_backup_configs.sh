#!/bin/bash/

# Резервное копирование файлов конфигураций elk
dpath=./backup_elk/

spath=/etc/elasticsearch/
cp --parents ${spath}elasticsearch.yml ${dpath} 
cp --parents ${spath}jvm.options.d/jvm.options ${dpath}
#scp smith@192.168.122.155:${spath}elasticsearch.yml ./backup_elk/ 
#scp smith@192.168.122.155:${spath}jvm.options.d/jvm.options ./backup_elk/ 

spath=/etc/kibana/
cp --parents ${spath}kibana.yml ${dpath}
#scp smith@192.168.122.155:${spath}kibana.yml ./backup_elk/ 

spath=/etc/logstash/
cp --parents ${spath}logstash.yml ${dpath}
cp --parents ${spath}conf.d/logstash-nginx-es.conf ${dpath}
#scp smith@192.168.122.155:${spath}logstash.yml ./backup_elk/ 
#scp smith@192.168.122.155:${spath}conf.d/logstash-nginx-es.conf ./backup_elk/ 

spath=/etc/filebeat/
cp --parents ${spath}filebeat.yml ${dpath}
#scp smith@192.168.122.155:${spath}filebeat.yml ./backup_elk/ 