# Access pulsar-manager
See [Access-pulsar-manager](https://github.com/apache/pulsar-manager#access-pulsar-manager)

```
CSRF_TOKEN=$(curl http://pulsarmanager.localhost/pulsar-manager/csrf-token)
curl \
    -H "X-XSRF-TOKEN: $CSRF_TOKEN" \
    -H "Cookie: XSRF-TOKEN=$CSRF_TOKEN;" \
    -H 'Content-Type: application/json' \
    -X PUT http://pulsarmanager.localhost/pulsar-manager/users/superuser \
    -d '{"name": "admin", "password": "apachepulsar", "description": "test", "email": "username@test.org"}'
```

### Add Environment

Service URL

```
http://pulsar-proxy
```


### Proxy as root

[Pulsar proxy fails to start with pulsar Docker image that uses non-root user](https://github.com/apache/pulsar-helm-chart/issues/110)

Paste to proxy
```
  securityContext:
    runAsUser: 0
    runAsGroup: 0
```