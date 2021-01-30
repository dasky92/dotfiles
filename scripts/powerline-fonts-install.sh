#! /usr/bin/sh

# home directory
cd ~
# clone
git clone https://gitee.com/jiangming_gitee/Powerline-Fonts.git
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
