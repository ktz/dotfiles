#!/bin/sh -eu

DIR="$( cd "$( dirname "$0" )" && pwd )"

ln -sf ${DIR}/zsh/.zshenv ${HOME}/.zshenv
ln -sf ${DIR}/zsh/.zshrc ${HOME}/.zshrc
ln -sf ${DIR}/tmux/.tmux.conf ${HOME}/.tmux.conf

if [ ! -d ~/.config/nvim ]; then
  mkdir -p ~/.config/nvim
fi
ln -sf ${DIR}/neovim/.config/nvim/init.lua ~/.config/nvim/init.lua
if [ ! -d ~/.config/nvim/lua ]; then
  mkdir -p ~/.config/nvim/lua
fi
ln -sf ${DIR}/neovim/.config/nvim/lua/plugins.lua ~/.config/nvim/lua/plugins.lua

if [ ! -d ~/.config/kitty ]; then
  mkdir -p ~/.config/kitty
fi
ln -sf ${DIR}/kitty/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf

if [ ! -d ~/.config/yabai ]; then
  mkdir -p ~/.config/yabai
fi
ln -sf ${DIR}/yabai/.config/yabai/yabairc ~/.config/yabai/yabairc

if [ ! -d ~/.config/skhd ]; then
  mkdir -p ~/.config/skhd
fi
ln -sf ${DIR}/skhd/.config/skhd/skhdrc ~/.config/skhd/skhdrc
