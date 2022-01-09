if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting
set -gx SHELL /usr/local/bin//fish
set -gx LANG ja_JP.UTF-8
set -gx LC_COLLATE "en_US.UTF-8"
set -gx LC_CTYPE "en_US.UTF-8"
set -gx LC_MESSAGES "en_US.UTF-8"
set -gx LC_MONETARY "en_US.UTF-8"
set -gx LC_NUMERIC "en_US.UTF-8"
set -gx LC_TIME "en_US.UTF-8"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx CLOUDSDK_PYTHON python

function fish_user_key_bindings
  bind \cr peco_select_history
end

set -gx PATH $PATH /usr/local/bin
source /usr/local/opt/asdf/libexec/asdf.fish
