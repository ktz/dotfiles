export SHELL=/bin/zsh

export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"

export XDG_CONFIG_HOME=$HOME/.config

case ${OSTYPE} in
  darwin*)
    export PATH=/usr/local/bin/:$PATH
    export EDITOR=/usr/local/bin/nvim
    ;;
  linux-gnu)
    export EDITOR=/usr/bin/nvim
    ;;
esac

export FZF_DEFAULT_OPTS='--color=fg+:11 --height 40% --reverse --select-1 --margin=0,1'

. "$HOME/.cargo/env"
