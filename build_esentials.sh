#!/bin/bash

set -e

# Replace ubuntu source with aliyun source for APT
cp /etc/apt/sources.list /etc/apt/sources.list.old && \
sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

apt-get update -y --fix-missing
apt-get install -y \
    cmake \
    git \
    software-properties-common \
    htop \
    tree \
    less \
    wget \
    yum \
    tmux
