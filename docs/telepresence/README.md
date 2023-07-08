## Telepresence


[Telepresence](https://github.com/telepresenceio/telepresence)
用于打通本地和集群之间的网络


## Usage

下载cli 命令行工具
[releases](https://github.com/telepresenceio/telepresence/releases)

本地——>集群 (本地出站流量)
```
telepresence login --apikey xxx
telepresence connect
```
[ambassador cloud](https://app.getambassador.io/cloud) 登陆获取apikey
可以直接使用浏览器通过 {svc}.{namespace}:{svc port} 来访问对于http应用


集群——>本地 (本地入站流量)
```
telepresence intercept argocd-server --port 9000:80 -- python -m http.server 9000
```
访问argocd-server 应用时会拦截流量到 这个 ```python -m http.server 9000``` 的服务，然后返回给 argocd-server 应用




总的来说就是方便了本地开发微服务的调试，不用每次都要部署到集群才能调通微服务之间的依赖，唯一不好的点，就是个人模式下只能访问拦截default 的命名空间下的应用流量到本地，除非你开启团队模式，才能访问别的namespace，不过这个需要付费订阅