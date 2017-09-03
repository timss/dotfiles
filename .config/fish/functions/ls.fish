function ls --description "List contents of directory"
    command ls -h --color=auto --group-directories-first --time-style='+%d.%m.%y %H:%M' $argv;
end

# /usr/share/fish/functions/ls.fish
if not set -q LS_COLORS
    if command -sq dircolors
        set -l colorfile
        for file in ~/.dir_colors ~/.dircolors /etc/DIR_COLORS
            if test -f $file
                set colorfile $file
                break
            end
        end
        # Here we rely on the legacy behavior of `dircolors -c` producing output suitable for
        # csh in order to extract just the data we're interested in.
        set -gx LS_COLORS (dircolors -c $colorfile | string split ' ')[3]
        # The value should always be quoted but be conservative and check first.
        if string match -qr '^([\'"]).*\1$' -- $LS_COLORS
            set LS_COLORS (string match -r '^.(.*).$' $LS_COLORS)[2]
        end
    end
end
