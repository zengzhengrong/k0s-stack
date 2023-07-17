# Verify the installation

Verify directory is offical verify by 
https://docs.nvidia.com/datacenter/cloud-native/gpu-operator/getting-started.html#running-sample-gpu-applications


# Notbook

token 

```
kubectl.exe logs tf-notebook
```

run ```text_classification_with_hub.ipynb```


text_classification_with_hub.ipynb#Train-the-model

```
gpu_available = tf.config.list_physical_devices('GPU')
```

```
nvidia-smi
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 515.65.01    Driver Version: 516.94       CUDA Version: 11.7     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  NVIDIA GeForce ...  On   | 00000000:01:00.0  On |                  N/A |
| 43%   55C    P2    53W / 120W |   2896MiB /  3072MiB |     84%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+

+-----------------------------------------------------------------------------+
| Processes:                                                                  |
|  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
|        ID   ID                                                   Usage      |
|=============================================================================|
|    0   N/A  N/A        11      C   /python3.8                      N/A      |
+-----------------------------------------------------------------------------+
```