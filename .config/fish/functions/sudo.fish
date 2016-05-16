function sudo --description "Execute a command as another user"
    if test (count $argv) -gt 0
        # history expasion; run last command
        # https://gist.github.com/b-/981892a65837ab0a387e
        if test $argv[1] = "!!"
            # evade recursive sudo function
            eval /usr/bin/sudo $history[1];
        else if test $argv[1] = "vim"
            # see sudoedit.fish
            sudoedit $argv[2..-1];
        else
            command sudo $argv;
        end
    else
        command sudo;
    end
end
