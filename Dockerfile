FROM nvidia/cuda:11.3.1-base

# Never prompts the user for choices on installation/configuration of packages
ENV DEBIAN_FRONTEND noninteractive
ENV TERM linux

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt install -y wget dnsutils
WORKDIR /tmp
# RUN apt-get autoremove --purge cudo-miner
RUN wget -q https://download.cudo.org/tenants/135790374f46b0107c516a5f5e13069b/5e5f800fdf87209fdf8f9b61441e53a1/linux/x64/release/v1.6.3-rc.0/cudo-miner-headless.deb \
 && wget -q https://download.cudo.org/tenants/135790374f46b0107c516a5f5e13069b/5e5f800fdf87209fdf8f9b61441e53a1/linux/x64/release/v1.6.3-rc.0/cudo-miner-core.deb \
 && wget -q https://download.cudo.org/tenants/135790374f46b0107c516a5f5e13069b/5e5f800fdf87209fdf8f9b61441e53a1/linux/x64/release/v1.6.3-rc.0/cudo-miner-cli.deb \
 && wget -q https://download.cudo.org/tenants/135790374f46b0107c516a5f5e13069b/5e5f800fdf87209fdf8f9b61441e53a1/linux/x64/release/v1.6.3-rc.0/cudo-miner-service.deb

RUN apt update && apt upgrade -y
RUN apt install -y libpci3 libpci-dev libx11-dev libxext-dev libxxf86vm-dev libnuma-dev systemd libnvidia-ml-dev
RUN dpkg -i cudo-miner-headless.deb cudo-miner-core.deb cudo-miner-cli.deb cudo-miner-service.deb
RUN rm -rf *.deb

ENV SOCKET_PATH=/var/lib/cudo-miner.sock
ENV REBOOT_IDLE_TIME=30
ENV STORE_PATH=/var/lib/cudo-miner/store
ENV REGISTRY_PATH=/var/lib/cudo-miner/registry
ENV BIN_PATH=/usr/local/cudo-miner/bin
ENV RUNTIME_PATH=/usr/local/cudo-miner/runtime
WORKDIR /usr/local/cudo-miner

CMD ["/usr/local/cudo-miner/cudo-miner-core"] #, "--autoenrol-org", "labour-antelope"]


