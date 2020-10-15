#! /usr/bin/sh


get_os() {

    declare -r OS_NAME="$(uname -s)"
    local os=""
    local cmd=""

    if [ "$OS_NAME" == "Darwin" ]; then
        os="osx"
        cmd="brew"
    elif [ "$OS_NAME" == "Linux" ] && [ -e "/etc/lsb-release" ]; then
        os="ubuntu"
        cmd="apt-get"
    elif [ "$OS_NAME" == "Linux" ] && [ -e "/etc/redhat-release" ]; then
        os="centos"
        cmd="yum"
    fi

    printf "%s" "$os"

}


# pdf2text postman wireshark
# 1. install brew for osx
# 2. change system china source for linux
# 3. set brew china# 1. install brew for osx
# 4. execute `brew.sh, brew-cask.sh, or install.sh`
# 5. load config.yaml and ln -s


# install brew for MacOS
if [ "$os" == "osx" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  # set homebrew china source
fi
