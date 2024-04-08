#!/bin/bash

#setup env vars
source ./local_env.sh

# Enable deb-srcs
sudo sed -i '/^#\sdeb-src /s/^#//' "/etc/apt/sources.list"

# build kernel dependencies
sudo apt-get build-dep -y linux

# Install additional packages
sudo apt install -y \
                    git \
                    build-essential \
                    libncurses-dev \
                    flex \
                    bison \
                    openssl \
                    libssl-dev \
                    dkms \
                    libelf-dev \
                    libudev-dev \
                    libpci-dev \
                    libiberty-dev \
                    autoconf \
                    wget \
                    qemu-kvm \
                    qemu-system-x86 \
                    bridge-utils \
                    gcc g++ \
                    iproute2 \
                    tmux \
                    gdb \
                    vim \
                    debootstrap


git clone https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git $KERNEL

build_kernel --debug
echo "set auto-load safe-path /" >> ~/.gdbinit

pushd $IMAGE
./create-image.sh
popd

mkdir $WORKSPACE

git clone  https://github.com/pwndbg/pwndbg
pushd pwndbg
./setup.sh