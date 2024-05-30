# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

case ${OSTYPE} in
  darwin*)
    source /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme
    . /usr/local/opt/asdf/libexec/asdf.sh
    source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source $HOME/Documents/macOS/zshrc.local
    ;;
  linux-gnu)
    if [ -e /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme ]; then
      source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
    fi
    . "$HOME/.asdf/asdf.sh"
    # . "$HOME/.asdf/completions/asdf.bash"
    if [ -e /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
      source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    fi
    if [ -e /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
      source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    fi
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
