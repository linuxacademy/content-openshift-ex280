#!/bin/bash
# infra node config script
curl -o /etc/docker/daemon.json \
    https://raw.githubusercontent.com/linuxacademy/content-openshift-ex280/release-3.9/scripts/daemon.json
sleep 10
systemctl restart docker
