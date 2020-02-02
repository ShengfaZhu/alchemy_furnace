#!/bin/bash
#
# upgrade to python3.7 on ubuntu OS
#

set +e

# 0. preinstall
echo "pre-install esentials..."
apt-get update
apt-get install -y zlib1g-dev libbz2-dev libssl-dev libncurses5-dev \
	libsqlite3-dev libreadline-dev tk-dev libgdbm-dev libdb-dev \
	libpcap-dev xz-utils libexpat1-dev libffi-dev

echo "pre-install esentials successfully"

# 1. upgrade python3.5 to python3.7
## 1.1 download python3.7
echo "download python3.7..."
cd /tmp
wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz
tar -zxvf Python-3.7.4.tgz
echo "download python3.7 successfully"

echo "unzip tgz of python3 and make install..."
cd /tmp/Python-3.7.4
mkdir -p /usr/local/python3
./configure --prefix=/usr/local/python3  --enable-optimizations
make -j4 
make install
echo "unzip tgz of python3 and make install successfully"

## 1.2 setup symbolic link
echo "setup symbolic link for python3..."
rm -rf /usr/bin/python3
rm -rf /usr/bin/pip3
ln -s /usr/local/python3/bin/python3.7 /usr/bin/python3
ln -s /usr/local/python3/bin/pip3.7 /usr/bin/pip3
echo "setup symbolic link for python3 successfully"

## 1.3 check python version
echo "python3 version: "
python3 --version


# 2 install packages from requiremnent
echo "install packages..."
release_file="/usr/bin/lsb_release"
if [ -f "${release_file}" ]; then
echo "${release_file} existed, mannally remove it"
rm ${release_file}
fi

pip3 install -r /tmp/requirements.txt
echo "install packages successfully"
echo "install python3 successfully"
