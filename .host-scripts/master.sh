#!/bin/bash
echo "hello"
curl -o /etc/docker/daemon.json \
    https://raw.githubusercontent.com/linuxacademy/content-openshift-ex280/release-3.9/scripts/daemon.json
systemctl restart docker
