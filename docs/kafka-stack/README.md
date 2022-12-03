### Set up kafka

1. Install zookeeper

```
kubectl apply -f .\manifests\zookeeper.yaml 
```
Waiting  completed
```
kubectl rollout status statefulset/zookeeper -n zookeeper
```

2. Install kafka

```
kubectl apply -f .\manifests\kafka.yaml 
```

3. Install kafka-ui

```
kubectl apply -f .\manifests\kafdrop.yaml 
```