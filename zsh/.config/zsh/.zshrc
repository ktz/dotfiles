HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

setopt NOBEEP
setopt NUMERIC_GLOB_SORT

if type zoxide > /dev/null; then
  eval "$(zoxide init zsh)"
fi

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'


case ${OSTYPE} in
  darwin*)
    source /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme
    # . /usr/local/opt/asdf/libexec/asdf.sh
    export ASDF_DATA_DIR="$HOME/.asdf"
    export PATH="$ASDF_DATA_DIR/shims:$PATH"
    source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source $HOME/Documents/macOS/zshrc.local
    if type direnv > /dev/null; then
      eval "$(direnv hook zsh)"
    fi
    ;;
  linux-gnu)
    # eval "$(sheldon source)"
    source $HOME/.zshrc.local
    eval "$(mise activate zsh)"
    eval "$(fnox activate zsh)"
    ;;
esac
# if type fzf > /dev/null; then
#   eval "$(fzf --zsh)"
# fi
# Arch
if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
fi
# macOS Apple silicon
if [[ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]]; then
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
  source /opt/homebrew/opt/fzf/shell/completion.zsh
fi
# macOS Intel
if [[ -f /usr/local/opt/fzf/shell/key-bindings.zsh ]]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

export PNPM_HOME="/home/ktz/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export PATH="$HOME/.moon/bin:$PATH"

source "$ZDOTDIR/fzf.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/bindings.zsh"
source "$ZDOTDIR/plugins.zsh"
source "$ZDOTDIR/prompt.zsh"
