# Минимальный набор правил для IPTABLES

### Сохранение в файл и восстановление набора правил
	- iptables-save > ./iptables.rules

	- iptables-restore < ./iptables.rules

### Установить iptables-persistent
	- `apt install iptables-persistent netfilter-persistent`
	- `netfilter-persistent save` # сохранение правил
	- `netfilter-persistent start`

### Установка политики по умолчанию
	- `iptables -P INPUT DROP`
	- `iptables -P OUTPUT DROP`
	- `iptables -P FORWARD DROP`
