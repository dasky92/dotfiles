#! /bin/sh

if [ "$(command -v brew)" == "" ]; then
  # install brew for mac
  /bin/sh -c "$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)"
else
  echo "brew is already installed."
fi


cat "./brew_app" | while read -r line
do
  if [[ "$line" != ^#* ]]; then
    brew install "$line"
  fi
done


cat "./brew_cask_app" | while -r read line
do
  if [[ "$line" != ^#* ]]; then
    brew cask install "$line"
  fi
done
