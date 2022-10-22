#!/bin/sh
set -e

export LANG=en_US.UTF-8

nohup k0s controller --config=/etc/k0s/config.yaml --enable-worker > k0s.log 2>&1 &

sleep 5

k0s token create --role=worker > /var/token/k0s.token

tail -f k0s.log