#! /bin/sh

# home directory
cd ${HOME}
# clone
git clone https://gitee.com/jiangming_gitee/Powerline-Fonts.git fonts
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
