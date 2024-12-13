# Минимальный набор правил для IPTABLES

>файл *iptables.rules*

#### Сохранение в файл и восстановление набора правил

```bash
iptables-save > ./iptables.rules
iptables-restore < ./iptables.rules
```

#### Установить iptables-persistent
```bash
 apt install iptables-persistent netfilter-persistent
 netfilter-persistent save # сохранение правил
 netfilter-persistent start
```
#### Установка политики по умолчанию
```bash
 iptables -P INPUT DROP
 iptables -P OUTPUT DROP
 iptables -P FORWARD DROP
```