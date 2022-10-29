# Access pulsar-manager
See [Access-pulsar-manager](https://github.com/apache/pulsar-manager#access-pulsar-manager)

```
CSRF_TOKEN=$(curl http://backend-service:7750/pulsar-manager/csrf-token)
curl \
    -H "X-XSRF-TOKEN: $CSRF_TOKEN" \
    -H "Cookie: XSRF-TOKEN=$CSRF_TOKEN;" \
    -H 'Content-Type: application/json' \
    -X PUT http://backend-service:7750/pulsar-manager/users/superuser \
    -d '{"name": "admin", "password": "apachepulsar", "description": "test", "email": "username@test.org"}'
```