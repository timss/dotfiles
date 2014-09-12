# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Bash prompt
export PS1='\[\033[0;36m\]\W\[\033[0;32m\]$(__git_ps1 " (%s)") \[\033[0;34m\]>\[\033[0m\] '

### Autocomplete {{{
    if [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi

    complete -cf sudo man type
    complete -W "+%H:%M +%d.%m.%y_%H:%M" date
    bind "set completion-ignore-case on"
### }}}

# Environment variables
export LANG=en_US.UTF-8

# History
export HISTSIZE="10000"
export HISTFILESIZE="10000"
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups  # don't duplicate
shopt -s histappend                                        # append, not write

### Functions {{{
    # Calculator, math 100/2*10 {{{
    function math() {
        echo "scale=2 ; $*" | sed -e "s:x:*:g" | sed -e "s:,::g" | bc
    }

    # Preserve environment when doing "sudo vim [..]"
    function sudo() {
        case $* in
            vim* ) shift 1; command sudo -E vim "$@" ;;
            * ) command sudo "$@" ;;
        esac
    }
### }}}

# Source additional files
if [ -f $HOME/.alias ]; then . $HOME/.alias; fi

# Source locals, don't add to git repo
if [ -f $HOME/.bashrc.local ]; then source $HOME/.bashrc.local; fi
if [ -f $HOME/.alias.local ]; then source $HOME/.alias.local; fi
