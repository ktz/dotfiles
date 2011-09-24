export LANG=ja_JP.UTF-8
export SHELL=/bin/zsh
export LC_TYPE=C
export LC_ALL=C
export PATH=/usr/local/bin/:$PATH
 
PROMPT="%{[31m%}%n@%m${WINDOW:+"[$WINDOW]"}
%%%{[m%} "
PROMPT2="%{[31m%}%_%%%{[m%} "
RPROMPT="%{[31m%}[%~]%{[m%} "
SPROMPT="%{[36m%}%r is correct? [n,y,a,e]:%{[m%} "
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{[36m%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
 
setopt auto_cd
setopt auto_pushd
setopt correct
setopt list_packed
setopt noautoremoveslash
setopt nolistbeep
 
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end
 
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history
 
fpath=(~/.zsh/functions/Completion ${fpath})
autoload -U compinit
compinit
 
autoload zed
 
setopt complete_aliases

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color"
    ;;
esac

export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
 
precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
}
 
if [[ "$TERM" == "screen" ]]; then
    preexec() {
        echo -ne " k${1%% *} \\"
    }
fi

alias screen="screen -U"
alias crontab="EDITOR=nano crontab"
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine
