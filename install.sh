#!/bin/sh -eu

DIR="$( cd "$( dirname "$0" )" && pwd )"

ln -sf ${DIR}/zshenv ${HOME}/.zshenv
ln -sf ${DIR}/zshrc ${HOME}/.zshrc
ln -sf ${DIR}/tmux.conf ${HOME}/.tmux.conf
ln -sf ${DIR}/inputrc ${HOME}/.inputrc

which nvim > /dev/null 2>&1
if [ $? -eq 0 ]; then
  if [ ! -d ~/.config/nvim ]; then
    mkdir -p ~/.config/nvim
  fi
  ln -sf ${DIR}/config/nvim/init.vim ~/.config/nvim/init.vim
else
  cp ${DIR}/config/nvim/init.vim ~/.vimrc
fi

