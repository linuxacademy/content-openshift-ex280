#!/bin/bash
# NFS storage configuration script by T. Nichole Williams
# Run this script to install NFS components & configure firewall on storage
# node. This script is provided with NO warranties or guarantees. Please run
# at your own risk.

# install NFS utilities
sudo yum -y install nfs-utils

# create directories under /home/data/ for persistent storage
mkdir -p /home/data/persistent0{1,2,3,4,5}

# change permissions to allow usage by NFS
chown -R nfsnobody:nfsnobody /home/data/
chmod 700 /home/data/persistent01
chmod 700 /home/data/persistent02
chmod 700 /home/data/persistent03
chmod 700 /home/data/persistent04
chmod 700 /home/data/persistent05

# Create dbvol.exports under /etc/exports.d
curl -o /etc/exports.d/dbvol.exports https://raw.githubusercontent.com/linuxacademy/content-openshift-ex280/release-3.9/scripts/dbvol.exports

# Permit NFS usage in SeLinux
setsebool -P virt_use_nfs 1

# Enable & start NFS service
systemctl enable --now nfs

# add NFS Shares to system
exportfs -a

# Permanently open TCP/UDP ports 2049 & 111 on firewall
firewall-cmd --permanent --add-port=111/tcp
firewall-cmd --permanent --add-port=111/udp
firewall-cmd --permanent --add-port=2049/tcp
firewall-cmd --permanent --add-port=2049/udp
firewall-cmd --reload
