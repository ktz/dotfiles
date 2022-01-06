#!/bin/sh -eu

DIR="$( cd "$( dirname "$0" )" && pwd )"

ln -sf ${DIR}/zshenv ${HOME}/.zshenv
ln -sf ${DIR}/zshrc ${HOME}/.zshrc
ln -sf ${DIR}/tmux.conf ${HOME}/.tmux.conf
ln -sf ${DIR}/inputrc ${HOME}/.inputrc

if [ ! -d ~/.config/nvim ]; then
  mkdir -p ~/.config/nvim
fi
ln -sf ${DIR}/config/nvim/init.lua ~/.config/nvim/init.lua

if [ ! -d ~/.config/kitty ]; then
  mkdir -p ~/.config/kitty
fi
ln -sf ${DIR}/config/kitty/kitty.conf ~/.config/kitty/kitty.conf
