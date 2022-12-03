## Install Requirement

1. etcd 

```
kubectl apply -f manifests/etcd.yaml
```

2. zookeeper cluster

```
kubectl apply -f manifests/zookeeper.yaml
```

3. kafka cluster & web-ui

```
kubectl apply -f manifests/kafka.yaml
```

```
kubectl apply -f manifests/kafdrop.yaml
```


4. radondb-mysql-operator & mysql cluster

```
kubectl apply -f manifests/radondb-mysql-operator.yaml
```

```
kubectl apply -f manifests/radondb-mysql-sample.yaml
```

5. redis-operator & redis-standalone

```
kubectl apply -f manifests/redis-operator.yaml
```

```
kubectl apply -f manifests/redis-standalone.yaml
```

6. mongodb & web-ui


```
kubectl apply -f manifests/mongodb.yaml
```

```
kubectl apply -f manifests/mongo-express.yaml
```



## Install openim

usual_configmap.yaml would overwirte configmap.yaml

```
kubectl apply -f docs\openim
```