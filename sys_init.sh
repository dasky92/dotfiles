#!/usr/bin/bash

# init you system

# set your network
# edit you /etc/sysconfig/network-scripts/ifcfg-enp*
# add 'BOOT=yes DNS1=8.8.8.8 DNS2=4.2.2.2'

# install development dependency
# yum update
INSTALL_LIB(){
    yum install git vim
    yum install zlib zlib-devel bzip2 bzip2-devel openssl openssl-devel libffi libffi-devel gcc gcc-c++ libstdc++-devel
}

INSTALL_PYTHON3(){
    echo "start install python3..."
    wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz
    tar -xvf Python-3.7.4.tgz
    cd Python-3.7.4
    mkdir -p /usr/local/python3
    ./configure --prefix=/usr/local/python3
    make && make install
    ln -s /usr/local/pythons/python3 /usr/bin/python3
    python3 --version
    echo "python3 installed."
} 

INSTALL_VIMRC(){
    echo "start install vimrc..."
    mkdir -p ~/.vim/colors
    cd ~
    git clone https://github.com/wanchaosoft/daevim.git ~/.vim
    ln -s ~/.vim/.vim.local ./.vimrc
    echo "vimrc installed."
}
INSTALL_NGINX(){
    yum install nginx
    # start nginx
    nginx
}

MAIN(){
    INSTALL_LIB
    yum update
    cd /opt
    INSTALL_PYTHON3
    cd /opt
    INSTALL_VIMRC
    cd /opt
    INSTALL_NGINX
    cd /opt
}

# execute it
MAIN
