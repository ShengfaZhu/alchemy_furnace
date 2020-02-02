#!/bin/bash

set +e

# 1.1 install dependencies
echo "install vim8 from source code..."
apt install -y libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git
    
# 1.2 remove vim 
apt remove vim vim-runtime gvim
apt remove vim-tiny vim-common vim-gui-common vim-nox

# 1.3 download source code
cd /tmp/
git clone https://github.com/vim/vim.git

# 1.4 compile and install source code
cd vim/
./configure --with-features=huge --enable-pythoninterp --enable-python3interp \
    --enable-rubyinterp --enable-luainterp --enable-perlinterp \
    --with-python3-config-dir=/usr/local/python3/bin/python3-config/ \
    --enable-gui=gtk2 --enable-cscope --prefix=/usr
make
make install
make clean
echo "install vim8 successfully"

# 2. install plugins
apt-get update 
apt-get install -y curl clang-format
## 2.1 make sure vimrc existed
VIMRC_FILE=/root/.vimrc
if [ -f "${VIMRC_FILE}" ] 
then
echo ".vimrc file found"
else 
echo ".vimrc file not existed"
exit 1
fi

## 2.2 download vundle
echo "Vundle download..."
git clone https://github.com/VundleVim/Vundle.vim.git /root/.vim/bundle/Vundle.vim
echo "Vundle download successfully"

## 2.3 install dependencies
echo "install dependencies..."
cd /root/.vim/bundle/
git clone https://github.com/ycm-core/YouCompleteMe.git 
cd /root/.vim/bundle/YouCompleteMe/
git submodule update --init --recursive
./install.py --clang-complete
echo "install dependencies successfully"

## 2.4 install plugins
echo "plugins install..."
vim -c PluginInstall -c q -c q
echo "plugins install successfully"
