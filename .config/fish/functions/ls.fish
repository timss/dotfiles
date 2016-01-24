function ls --description "List directory contents"
    command ls -h --color=auto --group-directories-first --time-style='+%d.%m.%y %H:%M' $argv;
end
