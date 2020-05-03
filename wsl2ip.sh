#!/bin/bash
ifconfig | awk '$1 == "inet" {print $2; exit}' > tmp_ip
current_ip=$(<tmp_ip)
current_ip="${current_ip}    rafik.api.kpfp.com"
cp /mnt/c/Windows/System32/drivers/etc/hosts tmp_hosts
sed -i "s/172.*/$current_ip/" tmp_hosts
sed -i "s/172.*/$current_ip/" /etc/hosts
cp tmp_hosts /mnt/c/Windows/System32/drivers/etc/hosts
rm tmp_ip
rm tmp_hosts
service mysql start
service apache2 restart
