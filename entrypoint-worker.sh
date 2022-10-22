#!/bin/sh
set -e

export LANG=en_US.UTF-8

 i=1 
 time=$(date "+%Y%m%d") 
 while [ $i -le 10 ] 
 do 
 if [ -f "$1" ]; then 
    echo "$time" 
    echo "file exits" 
    echo "sleep 10s to wait kubelet"
    sleep 10
    k0s worker --token-file /var/token/k0s.token --labels="node.k0sproject.io/role=worker"
    echo "$?"; 
    break;
 else
    echo "sleep $1"
    sleep 1
    let i++
fi
done