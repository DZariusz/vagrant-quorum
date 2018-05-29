#!/bin/bash

# install mDNS
apt-get install -y avahi-daemon libnss-mdns

curl -LO https://dist.ipfs.io/go-ipfs/v0.4.15/go-ipfs_v0.4.15_linux-amd64.tar.gz
tar -zxvf go-ipfs_v0.4.15_linux-amd64.tar.gz
sudo mv go-ipfs/ipfs /usr/local/bin/

cd ~
ipfs init