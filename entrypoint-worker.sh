#!/bin/sh
set -e
export LANG=en_US.UTF-8
source /etc/profile



i=1 
time=$(date "+%Y%m%d") 
while [ $i -le 30 ] 
do 
if [ -f "$1" ]; then 
   echo "$time" 
   echo "token exits" 
   echo "sleep 10s to wait kubelet"
   sleep 10
if [ $INIT ]; then
   
   echo "init to ontinue"
   k0s worker --token-file /var/token/k0s.token
else
   echo "init to start"
   if [ ! -e "/etc/k0s/containerd.toml" ]; then
      mkdir -p /etc/k0s
      echo '''
      version = 2
      [plugins."io.containerd.grpc.v1.cri".registry]
         config_path = "/etc/containerd/certs.d"
      ''' >> /etc/k0s/containerd.toml
   fi
   export INIT=1
   echo "export INIT=1" >> /etc/profile
   k0s worker --token-file /var/token/k0s.token --labels="node.k0sproject.io/role=worker"
   break;
fi
else
   echo "sleep $1"
   sleep 1
   let i++
fi
done