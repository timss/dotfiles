# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Bash prompt
export PS1='\[\033[0;36m\]\W\[\033[0;32m\]$(__git_ps1 " (%s)") \[\033[0;34m\]>\[\033[0m\] '

# Autocomplete using tab
if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
    complete -W "+%H:%M +%d.%m.%y_%H:%M" date
    bind "set completion-ignore-case on"
fi

# Always use UTF8
export LANG=en_US.UTF-8

# History, ignore duplicates, append
export HISTSIZE="10000"
export HISTFILESIZE="10000"
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
shopt -s histappend

# Editor and pager, https://github.com/rkitover/vimpager
# Git uses less if `git diff` etc has too many lines to print in terminal
export EDITOR=vim
export PAGER=vimpager
export GIT_PAGER=less

# Preserve environment when doing "sudo vim [..]"
function sudo() {
    case $* in
        vim* ) shift 1; command sudo -E vim "$@" ;;
        * ) command sudo "$@" ;;
    esac
}

# Source additional files; alias + local non-git versions of bashrc/alias
if [ -f $HOME/.alias ]; then source $HOME/.alias; fi
if [ -f $HOME/.bashrc.local ]; then source $HOME/.bashrc.local; fi
if [ -f $HOME/.alias.local ]; then source $HOME/.alias.local; fi

# vim: ft=sh
