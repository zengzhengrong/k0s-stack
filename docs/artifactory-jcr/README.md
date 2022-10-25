### Generate

```
kubectl create secret docker-registry k0s-registry \
--docker-server=artifactory.localhost \ 
--docker-username=admin \ 
--docker-password=admin \ 
--dry-run=client -o yaml > k0s-registry.yaml
```


### How to Push & Pull 

Create loacl registry ```k0s```  and remote registry ```k0s-remote``` (url :https://quay.dockerproxy.com)


##### Local

Push 
```
docker images 
nginx                                                           latest         2b7d6430f78d   2 months ago   142MB

docker tag nginx artifactory.localhost/k0s/nginx:latest
docker push artifactory.localhost/k0s/nginx:latest
```

yaml
```
...
    spec:
      imagePullSecrets:
        - name: k0s-registry
      containers:
      - name:  ngxin
        image: artifactory.localhost/k0s/nginx:latest
        imagePullPolicy: Always
        resources:
          requests:
...
```

##### Remote


Pull

```
quay.io/argoproj/argocli:v3.3.9 > artifactory.localhost/k0s-remote/argoproj/argocli:v3.3.9
```

```
kubectl apply -f docs/artifactory-jcr/k0s-registry.yaml -n argo
```


yaml
```
...
          image: 'artifactory.localhost/k0s-remote/argoproj/argocli:v3.3.9'
          imagePullPolicy: IfNotPresent
          name: argo-server
      dnsPolicy: ClusterFirst
      imagePullSecrets:
        - name: k0s-registry
```


