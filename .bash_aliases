# Programs
alias cal="cal -m"
alias g++="g++ -Wall -Wextra -pedantic -O3 -std=c++0x"
alias vi="vim"
alias xclip="xclip -selection c"

# File handling and moving around
alias cd..="cd .."
alias cp="cp -i"
alias fixdir="find . -type d -exec chmod 755 {} +"
alias fixfiles="find . -type f -exec chmod 644 {} +"
alias grep="grep -i"
alias ll="ls -l"
alias ls="ls -h --color=auto --group-directories-first --time-style='+%d.%m.%y %H:%M'"
alias mkdir="mkdir -p"
alias mv="mv -i"
alias rm="rm -I"
alias rsync="rsync --progress"
alias unp="unp -u"

# General
alias df="df -h"
alias diff="colordiff"
alias du="du -sh"
alias myip="wget ipecho.net/plain -O - -q; echo"
alias ping="ping -c 5"
alias tree="tree -C"

# Shorthand for editing dotfiles
alias aliases="vim $HOME/.bash_aliases"
alias bashrc="vim $HOME/.bashrc"
alias vimrc="vim $HOME/.vimrc"

# Merge multiple SSH configs
if [ -d "$HOME/.ssh/config.d" ]; then
    alias ssh="cat $HOME/.ssh/config.d/* > $HOME/.ssh/config; ssh"
fi

# vim: ft=sh
