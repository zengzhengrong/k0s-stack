## Mongodb Community

This is official install by [mongodb-kubernetes-operator](https://github.com/mongodb/mongodb-kubernetes-operator#documentation)

### Deploy Operator with Argocd

```
kubectl apply -f manifests/mongodb-community-operator.yaml
```

### Create mongodb

```
kubectl apply -f .\docs\mongodb\example-mongodb\mongodb.com_v1_mongodbcommunity_cr.yaml
```

### Deploy Sample to Verify Connection with Argocd

```
kubectl apply -f manifests/mongodb-sample-app.yaml
```

Ingress
```
kubectl apply -f .\docs\mongodb\sample-app\ingress.yaml
```

Access ```mongodb-sample-app.localhost```