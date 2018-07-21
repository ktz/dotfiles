#!/bin/bash

case $SHELL in
  */zsh)
    ln -sf ./zshenv ~/.zshenv
    ln -sf ./zshrc ~/.zshrc
    ;;
  */bash)
    ;;
  *)
esac
ln -sf ./tmux.conf ~/.tmux.conf
ln -sf ./inputrc ~/.inputrc
if [ ! -d ~/.config/nvim ]; then
  mkdir -p ~/.config/nvim
fi
ln -sf ./config/nvim/init.vim ~/.config/nvim/init.vim
