case ${OSTYPE} in
  darwin*)
    source /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme
    # . /usr/local/opt/asdf/libexec/asdf.sh
    export ASDF_DATA_DIR="$HOME/.asdf"
    export PATH="$ASDF_DATA_DIR/shims:$PATH"
    source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source $HOME/Documents/macOS/zshrc.local
    ;;
  linux-gnu)
    eval "$(sheldon source)"
    export ASDF_DATA_DIR="$HOME/.asdf"
    export PATH="$ASDF_DATA_DIR/shims:$PATH"
    fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)
    autoload -Uz compinit && compinit
    source $HOME/.zshrc.local
    ;;
esac

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

HISTFILE=$HOME/.zhistory
SAVEHIST=10000
HISTSIZE=10000
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_verify
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

if type zoxide > /dev/null; then
  eval "$(zoxide init zsh)"
fi
if type zabrze > /dev/null; then
  eval "$(zabrze init --bind-keys)"
fi
if type fzf > /dev/null; then
  eval "$(fzf --zsh)"
fi
if type direnv > /dev/null; then
  eval "$(direnv hook zsh)"
fi
# eval "$(ssh-agent -s)"
if type yazi > /dev/null; then
  function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    command yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd < "$tmp"
    [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
  }
fi
