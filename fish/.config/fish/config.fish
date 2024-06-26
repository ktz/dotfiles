if status is-interactive
    # Commands to run in interactive sessions can go here
  set fish_greeting "Interactive fish"
end

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
direnv hook fish | source
fzf --fish | source

switch (uname)
  case Darwin
    source $HOME/Documents/macOS/local.fish
end

if command -v eza > /dev/null
  abbr --add ls eza
end

if command -v rg > /dev/null
  abbr --add grep rg
end

if command -v fd > /dev/null
  abbr --add find fd
end

if command -v bat > /dev/null
  abbr --add cat bat
end
