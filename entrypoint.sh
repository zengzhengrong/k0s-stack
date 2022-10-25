#!/bin/sh
set -e

export LANG=en_US.UTF-8
time=$(date "+%Y%m%d")



if [ -f "/var/token/k0s.token" ]; then 
    echo "$time" 
    echo "token exits" 
    k0s controller
else
    mkdir -p /etc/k0s
    echo '''
    version = 2
    [plugins."io.containerd.grpc.v1.cri".registry]
       config_path = "/etc/containerd/certs.d"
    ''' >> /etc/k0s/containerd.toml
    nohup k0s controller --config=/etc/k0s/config.yaml --enable-worker > k0s.log 2>&1 &

    sleep 5

    k0s token create --role=worker > /var/token/k0s.token

    tail -f k0s.log
fi
