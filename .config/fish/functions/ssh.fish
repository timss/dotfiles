# merge multiple ssh configs
function ssh --description "OpenSSH SSH client (remote login program)"
    if test -d $HOME/.ssh/config.d
        command cat $HOME/.ssh/config.d/* > $HOME/.ssh/config;
    end
    command ssh $argv;
end

