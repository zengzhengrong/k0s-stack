## sealed secrets

当采用gitops 来管理 yaml 时, k8s 自带的 secret 也会一并上传到 git, 此时 在gitlab上 查看 manifest 的secret yaml 就会显示 明文(base64) , 这样的方式带来一些安全隐患  
sealed secrets 就是来解决这个问题，用cli或webui 将明文数据加密后 生成的 自定义 SealedSecret CRD (yaml/json)， 如mysealedsecret.json,  然后一并上传到git  
部署时 sealed-secrets-controller 会解析 SealedSecret CRD 并转成 k8s secret ，这样 workload 就能按常规方式 读取secret

https://github.com/bitnami-labs/sealed-secrets


![sealed-secrets](https://github.com/zengzhengrong/k0s-stack/blob/zh-cn/image/sealed-secrets.png)