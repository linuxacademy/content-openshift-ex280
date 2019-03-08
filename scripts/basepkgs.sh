#!/bin/bash
# simple bash script to install base packages for OKD v3.9 on KVM
# This script comes without warranty. Run at your own risk.

sudo yum -y update
# Install the CentOS OpenShift Origin v3.9 repo & all base packages
sudo yum -y install centos-release-openshift-origin39 wget git net-tools \
    bind-utils yum-utils iptables-services bridge-utils bash-completion \
    kexec-tools sos psacct vim git mlocate
# create .ssh folder in /root. Update the path if you plan to use a non-root
# user with Ansible.
mkdir -p /root/.ssh
# create passwordless ssh key for root. Update path if you're running a
# non-root user.
ssh-keygen -t rsa \
    -f /root/.ssh/id_rsa -N ''
sudo yum -y update
# Install the Extra Packages for Enterprise Linux (EPEL) repository
sudo yum -y install \
    https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
# disable EPEL repo to prevent package conflicts
sudo sed -i -e "s/^enabled=1/enabled=0/" /etc/yum.repos.d/epel.repo
# Install PyOpenSSL from EpEL repo
sudo yum -y --enablerepo=epel install pyOpenSSL
# install ansible-2.4.3.0 from CentOS archives
sudo yum -y install \
    https://cbs.centos.org/kojifiles/packages/ansible/2.4.3.0/1.el7/noarch/ansible-2.4.3.0-1.el7.noarch.rpm
sudo yum -y install \
    https://cbs.centos.org/kojifiles/packages/ansible/2.4.3.0/1.el7/noarch/ansible-doc-2.4.3.0-1.el7.noarch.rpm
# Reboot system to apply any kernel updates
sudo reboot
