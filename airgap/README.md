# Airgap images 

In this directory run :
```
docker run --rm --name data -d zengzhengrong889/k0s-airgap
docker cp data:/var/data/bundle_file ./bundle_file
```

```
cd ..
docker compose up -d
```

# Build 

```
docker build -t zengzhengrong889/k0s-airgap .
```