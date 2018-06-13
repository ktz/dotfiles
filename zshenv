export LANG=ja_JP.UTF-8
export LC_ALL=en_US.UTF-8
export SHELL=/bin/zsh
# export LC_TYPE=C
# export LC_ALL=C
# unset LC_CTYPE
export LESS='-R'
export LESSOPEN='| /usr/local/bin/src-highlight-lesspipe.sh %s'
export PGDATA=/usr/local/var/postgres
export XDG_CONFIG_HOME="~/.config"

export PATH="$HOME/.npm-packages/bin:$PATH"

export GOPATH=$HOME/go
export GOENV_ROOT=$HOME/.goenv
# export PATH=${GOENV_ROOT}/bin:$PATH
export PATH=${GOENV_ROOT}/shims:${GOENV_ROOT}/bin:$GOPATH/bin:$PATH
eval "$(goenv init -)"
# export GOPATH=$HOME/go
# # export GOROOT=/usr/local/opt/go/libexec
# # export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
# # export PATH=$PATH:/usr/local/opt/go/libexec/bin
# export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin
# export PATH="/usr/local/opt/go/bin:$PATH"
