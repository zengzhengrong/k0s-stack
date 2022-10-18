# k0s-stack
k0s argo stack is pretty simple setup kubernetes by use docker compose

# Usage
```
docker-compose up -d
```

# Argocd 


Access UI [argocd](http://argocd.localhost/) by default  username ```admin``` password ```admin```

# Argocd Applications

[manifest](https://github.com/zengzhengrong/k0s-stack/tree/zh-cn/manifests):

1. argo-event *
2. argo-rollouts *
3. argo-workflows *
4. eck-operator
5. eck-stack-noauth (require eck-operator)
6. openebs (local-path only) *
7. ingress-nginx *
8. pulsar (does not work)
9. rocketmq
10. rocketmq-cli (require rocketmq, validate rocketmq work fine)


Flag ```*``` is already installed by default
# Airgap

See airgap directory

# Issues

### storage

1.openebs issues in wsl https://github.com/openebs/openebs/issues/3487  
2.Only use local path pv