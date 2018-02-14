#!/bin/bash
# NFS configuration script for Wordpress Live lab

sudo mkdir -p /home/data/{wp,mysql}
sleep 3
sudo chown -R nfsnobody:nfsnobody /home/data/* && sudo chmod 700 /home/data/*
sleep 2
touch /etc/exports.d/data.exports && echo "/home/data/mysql *(rw,async,all_squash)" >> /etc/exports.d/data.exports && echo "/home/data/wp *(rw,async,all_squash)" >> /etc/exports.d/data.exports
sleep 3
systemctl start nfs && systemctl enable nfs
sleep 2
setsebool -P virt_use_nfs 1
sleep 2
iptables -I INPUT -p tcp --dport 111 -j ACCEPT && iptables -I INPUT -p udp --dport 111 -j ACCEPT && iptables -I INPUT -p tcp --dport 2049 -j ACCEPT && iptables -I INPUT -p udp --dport 2049 -j ACCEPT
sleep 3
service iptables save && service iptables restart
