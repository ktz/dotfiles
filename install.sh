#!/bin/zsh

ln -sf ./zshenv ~/.zshenv
ln -sf ./zshrc ~/.zshrc
ln -sf ./tmux.conf ~/.tmux.conf
ln -sf ./inputrc ~/.inputrc
ln -sf ./eslintrc ~/.eslintrc
if [ ! -d ~/.config/nvim ]; then
  mkdir -p ~/.config/nvim
fi
ln -sf ./config/nvim/init.vim ~/.config/nvim/init.vim
