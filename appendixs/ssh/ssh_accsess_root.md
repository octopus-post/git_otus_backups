# Настройка доступа root по сертификату.

1. Сгенерировать пару ключей:
```bash
#root
ssh-keygen [-t dsa|ecdsa|ecdsa-sk|ed25519|ed25519-sk|rsa ] [-f OUTPUT_KEYFILE]
```

2. В настройках ssh сервера в файле */etc/ssh/sshd_config* указать значение параметра
```
... 
PermitRootLogin prohibit-password
...
```

3. Скопировать публичный ключ на сервер:

#### Вариант 1
На сервере:

1. В файл */root/.ssh/authorized_keys* добавить строку с ключом из файла .pub.

#### Вариант 2

Скопировать ключ на удалённый хост
```bash
cd .ssh
$ ssh-copy-id [-p <PORT>] -i PUBKEYFILE.pub root@HOST
root@host's password:
```

____________

#### Авторизация на удалённом хосте:

```bash
$ ssh [-p <PORT>] -i <PATH_TO_PUBKEYFILE> 'root@<HOST>'
```