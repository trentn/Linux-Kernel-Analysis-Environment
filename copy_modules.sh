#!/bin/bash

DIR=$RELEASE

if [ ! -d /mnt/$DIR ]; then
    sudo mkdir /mnt/$DIR
fi

sudo mount -o loop $IMAGE/${RELEASE}_freshinstall.img /mnt/$DIR

pushd kernel
sudo make modules_install INSTALL_MOD_PATH=/mnt/$DIR INSTALL_MOD_DIR="extra"
popd

sudo umount /mnt/$DIR
sudo rmdir /mnt/$DIR

pushd $IMAGE
rm $RELEASE.img
qemu-img create -f qcow2 -b ${RELEASE}_freshinstall.img -F raw $RELEASE.img
popd