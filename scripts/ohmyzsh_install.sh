#! /bin/sh
# home dir
cd ${HOME}
# install oh-my-zsh
china_ohmyzsh="https://gitee.com/shrekuu/ohmyzsh.git"
ohmyzsh="git://github.com/robbyrussell/oh-my-zsh.git"
git clone "${china_ohmyzsh}" ~/.oh-my-zsh
# change default shell: zsh
chsh -s /bin/zsh
# install oh-my-zsh plugin: zsh-autosuggestions
git clone https://gitee.com/synchub/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# plugin: zsh-syntax-highlighting
git clone https://gitee.com/mo2/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# powerlevel10k theme
# git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
