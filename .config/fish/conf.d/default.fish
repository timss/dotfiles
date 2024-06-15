# Disable default greeting
set fish_greeting

set -gx EDITOR (which vim)

# If necessary delete using `set -e fish_user_paths[index]`
fish_add_path /sbin
fish_add_path /usr/sbin
fish_add_path /usr/local/sbin
fish_add_path $HOME/bin
fish_add_path $HOME/.cargo/bin
