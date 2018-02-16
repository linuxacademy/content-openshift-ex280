#!/bin/bash
# iptables config for master
# Wordpress lab

setsebool -P virt_use_nfs 1
sleep 2
iptables -I INPUT -p tcp --dport 111 -j ACCEPT && iptables -I INPUT -p udp --dport 111 -j ACCEPT
sleep 3
iptables -I INPUT -p tcp --dport 2049 -j ACCEPT && iptables -I INPUT -p udp --dport 2049 -j ACCEPT
service iptables save && service iptables restart
