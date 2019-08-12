#!/usr/bin/bash

# init you system

# set your network
# edit you /etc/sysconfig/network-scripts/ifcfg-enp*
# add 'BOOT=yes DNS1=8.8.8.8 DNS2=4.2.2.2'

# install development dependency
yum update

yum install git vim
yum install zlib zlib-devel bzip2 bzip2-devel openssl openssl-devel libffi libffi-devel gcc gcc-c++ libstdc++-devel

INSTALL_PYTHON3(){
    echo "start install python3..."
    echo "python3 installed."
} 

INSTALL_VIMRC(){
    echo "start install vimrc..."
    echo "vimrc installed."
}

