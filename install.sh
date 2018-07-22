#!/bin/bash

set -eu
DIR="$( cd "$( dirname "$0" )" && pwd )"

case $SHELL in
  */zsh)
    ln -sf ./zshenv ~/.zshenv
    ln -sf ./zshrc ~/.zshrc
    ;;
  */bash)
    ;;
  *)
esac

ln -sf ${DIR}/tmux.conf ~/.tmux.conf
ln -sf ${DIR}/inputrc ~/.inputrc

which nvim > /dev/null 2>&1
if [ $? -eq 0 ]; then
  if [ ! -d ~/.config/nvim ]; then
    mkdir -p ~/.config/nvim
  fi
  ln -sf ${DIR}/config/nvim/init.vim ~/.config/nvim/init.vim
else
  cp ${DIR}/config/nvim/init.vim ~/.vimrc
fi
