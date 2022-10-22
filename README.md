# k0s-stack
k0s argo stack is pretty simple setup kubernetes by use docker compose

# Usage
#### Single Mode

Control-plane and worker in one container

```
docker-compose up -d
```
#### Multiple Mode

Default one control-plane container and two wroker container , Ingress inside control-plane container
```
docker-compose -f .\docker-compose-cluster.yaml up -d
```

# Argocd 


Access UI [argocd](http://argocd.localhost/) by default  username ```admin``` password ```admin```

# Argocd Applications

1. argo-event *
2. argo-rollouts *
3. argo-workflows *
4. openebs (local-path only) *
5. ingress-nginx *
6. eck-operator
7. eck-stack-noauth (require eck-operator)
8. pulsar (does not work)
9. rocketmq
10.  rocketmq-cli (require rocketmq, validate rocketmq work fine)


See more [manifest](https://github.com/zengzhengrong/k0s-stack/tree/zh-cn/manifests)

Flag ```*``` is already installed by default
# Airgap

See airgap directory

# Issues

### storage

1.openebs issues in wsl https://github.com/openebs/openebs/issues/3487  
2.Only use local path pv