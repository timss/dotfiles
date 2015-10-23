# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source global definitions for rhel or debian based systems respectively
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
elif [ -f /etc/bash.bashrc ]; then
    source /etc/bash.bashrc
fi

# Bash prompt
export PS1='\[\033[0;36m\]\W\[\033[0;32m\]$(__git_ps1 " (%s)") \[\033[0;34m\]>\[\033[0m\] '

# Autocomplete using tab
if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
    complete -W "+%H:%M +%d.%m.%y_%H:%M" date
    bind "set completion-ignore-case on"
fi

# Bash git completion for rhel or debian based systems respectively
if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
    source /usr/share/git-core/contrib/completion/git-prompt.sh
elif [ -f /usr/lib/git-core/git-sh-prompt ]; then
    source /usr/lib/git-core/git-sh-prompt
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
