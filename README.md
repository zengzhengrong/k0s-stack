# k0s-stack
k0s argo stack is pretty simple setup kubernetes by use docker compose

# Usage

Enable wsl on ubuntu and install cuda

1. 

```
wsl --list --online
wsl --install --distribution <Distribution Name>
```
or manual https://docs.microsoft.com/en-us/windows/wsl/install-manual


![Docker](https://github.com/zengzhengrong/k0s-stack/blob/nvidia-container-runtime/image/docker.png)


https://docs.nvidia.com/cuda/wsl-user-guide/index.html#getting-started-with-cuda-on-wsl


```
wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-wsl-ubuntu.pin
sudo mv cuda-wsl-ubuntu.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.7.0/local_installers/cuda-repo-wsl-ubuntu-11-7-local_11.7.0-1_amd64.deb
sudo dpkg -i cuda-repo-wsl-ubuntu-11-7-local_11.7.0-1_amd64.deb
sudo apt-get update
sudo apt-get -y install cuda
```

1. Test GPU in wsl

```
docker run --rm -it --gpus=all nvcr.io/nvidia/k8s/cuda-sample:nbody nbody -gpu -benchmark
```

3. Start k0s
```
docker-compose up -d
```

4. Test GPU in k0s container

```
mv /var/lib/k0s/bin/containerd usr/local/bin/
k0s ctr run --gpus 0 --rm   nvcr.io/nvidia/k8s/cuda-sample:nbody test-gpu /tmp/nbody -gpu -benchmark
Run "nbody -benchmark [-numbodies=<numBodies>]" to measure performance.
        -fullscreen       (run n-body simulation in fullscreen mode)
        -fp64             (use double precision floating point values for simulation)
        -hostmem          (stores simulation data in host memory)
        -benchmark        (run benchmark to measure performance) 
        -numbodies=<N>    (number of bodies (>= 1) to run in simulation) 
        -device=<d>       (where d=0,1,2.... for the CUDA device to use)
        -numdevices=<i>   (where i=(number of CUDA devices > 0) to use for simulation)
        -compare          (compares simulation results running once on the default GPU and once on the CPU)
        -cpu              (run n-body simulation on the CPU)
        -tipsy=<file.bin> (load a tipsy model file for simulation)

NOTE: The CUDA Samples are not meant for performance measurements. Results may vary when GPU Boost is enabled.

> Windowed mode
> Simulation data stored in video memory
> Single precision floating point simulation
> 1 Devices used for simulation
GPU Device 0: "Pascal" with compute capability 6.1

> Compute 6.1 CUDA device: [NVIDIA GeForce GTX 1060 3GB]
9216 bodies, total time for 10 iterations: 7.874 ms
= 107.874 billion interactions per second
= 2157.472 single-precision GFLOP/s at 20 flops per interaction
```

# Argocd 

Access UI  by default  username ```admin``` password ```admin```



