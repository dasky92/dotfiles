#! /bin/sh
# home dir
cd ${HOME}
# install oh-my-zsh
china_ohmyzsh="https://gitee.com/shrekuu/ohmyzsh-ohmyzsh.git"
ohmyzsh="git://github.com/robbyrussell/oh-my-zsh.git"
git clone "${china_ohmyzsh}" ~/.oh-my-zsh
# change default shell: zsh
chsh -s /bin/zsh
# install oh-my-zsh plugin: zsh-autosuggestions
git clone https://gitee.com/synchub/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# plugin: zsh-syntax-highlighting
git clone https://gitee.com/mo2/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-theme: spaceship
git clone https://gitee.com/synchub/spaceship-prompt.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt" --depth=1

# link
ln -s "${ZSH_CUSTOM}/themes/spaceship-prompt/spaceship.zsh-theme" "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship.zsh-theme"
