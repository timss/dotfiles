#--------#
# Bashrc #
#--------#

### Bash {{{
    ### If not running interactively, don't do anything {{{
        [[ $- != *i* ]] && return
    ### }}}
    ### Bash prompt {{{
        PS1='\[\033[0;36m\]\W\[\033[0;32m\]$(__git_ps1 " (%s)") \[\033[0;34m\]>\[\033[0m\] '
        #PS1="\[\e[01;31m\]┌─[\[\e[01;35m\u\e[01;31m\]]──[\[\e[00;37m\]${HOSTNAME%%.*}\[\e[01;32m\]]:\w$\[\e[01;31m\]\n\[\e[01;31m\]└──\[\e[01;36m\]>>\[\e[0m\]"
    ### }}}
    ### Autocomplete {{{
        if [ -f /etc/bash_completion ]; then
            . /etc/bash_completion
        fi
        complete -cf sudo
        complete -cf man
        complete -cf type
        bind "set completion-ignore-case on"
        source ~/.git-prompt.sh
    ### }}}
    ### Environment variables  {{{
        HISTSIZE="10000"
        HISTFILESIZE="10000"
        export LANG=en_US.UTF-8
        export GIT_PAGER=/usr/bin/less
        ### Set PATH so it includes user's private bin if it exists {{{
            if [ -d "$HOME/bin" ] ; then
                PATH="$HOME/bin:$PATH"
            fi
        ### }}}
    ### }}}
    ### History {{{
        HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups  # don't duplicate
        shopt -s histappend                                 # append, not write
    ### }}}
### }}}
### Functions {{{
    ### Calculator, math 100/2*10 {{{
        function math() {
            echo "scale=2 ; $*" | sed -e "s:x:*:g" | sed -e "s:,::g" | bc
        }
    ### }}}
    ### Easy extract, extract folder.zip {{{
        function extract() {
            if [ -f $1 ]; then
                case $1 in
                    *.tar.bz2)   tar xjf $1         ;;
                    *.tar.gz)    tar xzf $1         ;;
                    *.bz2)       bunzip2 $1         ;;
                    *.rar)       unrar e $1         ;;
                    *.gz)        gunzip $1          ;;
                    *.tar)       tar xf $1          ;;
                    *.tbz2)      tar xjf $1         ;;
                    *.tgz)       tar xzf $1         ;;
                    *.zip)       unzip $1           ;;
                    *.Z)         uncompress $1      ;;
                    *.7z)        7z x $1            ;;
                    *)           echo "'$1' cannot be extracted via extract()" ;;
                esac
            else
                echo "'$1' is not a valid file"
            fi
        }
    ### }}}
### }}}
### Source additional files {{{
    ### Source alias {{{
        if [ -f ~/.alias ]; then
            . ~/.alias
        fi
    ### }}}
    ### Source locals, don't add to git repo {{{
        if [ -f ~/.bashrc.local ]; then
            . ~/.bashrc.local
        fi

        if [ -f ~/.alias.local ]; then
            . ~/.alias.local
        fi
    ### }}}
### }}}
