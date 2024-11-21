# Настройка доступа root по сертификату.

### На сервере:
Настроить доступ root по сертификату:

1. В файл /root/.ssh/authorized_keys добавить строку с ключом
2. В настройках ssh сервера в файле */etc/ssh/sshd_config* указать значение параметра
```
... 
PermitRootLogin prohibit-password
...
```

3. Расположение private key *~./.ssh/otus_rsa*
