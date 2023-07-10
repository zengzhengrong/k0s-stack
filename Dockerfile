FROM debian:bullseye-slim
COPY --from=zengzhengrong889/helm:3 /usr/bin/helm /usr/local/bin/helm
COPY --from=k0sproject/k0s:v1.23.10-k0s.0 /usr/local/bin/kubectl /usr/local/bin/kubectl
COPY --from=k0sproject/k0s:v1.23.10-k0s.0 /usr/local/bin/k0s /usr/local/bin/k0s
COPY --from=k0sproject/k0s:v1.23.10-k0s.0 /entrypoint.sh /entrypoint.sh

WORKDIR /

ENV KUBECONFIG=/var/lib/k0s/pki/admin.conf

RUN apt-get  update \
    && apt-get -y --no-install-recommends upgrade \
    && apt-get -y install --no-install-recommends gnupg2 ca-certificates curl \
    && curl -s -L https://nvidia.github.io/nvidia-container-runtime/gpgkey | apt-key add - \
    && curl -s -L https://nvidia.github.io/nvidia-container-runtime/$(. /etc/os-release;echo $ID$VERSION_ID)/nvidia-container-runtime.list |  tee /etc/apt/sources.list.d/nvidia-container-runtime.list \
    && apt-get -o Acquire::Check-Valid-Until=false update \
    && apt-get -y install --no-install-recommends iptables tini bash coreutils findutils nvidia-container-runtime nvidia-container-toolkit \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "tini","--","/bin/bash","./entrypoint.sh" ]

CMD ["k0s", "controller", "--enable-worker"]