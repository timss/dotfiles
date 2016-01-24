# history expasion; run last command
# https://gist.github.com/b-/981892a65837ab0a387e
function sudo --description "Execute a command as another user"
    if test $argv[1] = "!!"
        command sudo !!;
    else
        command sudo $argv;
    end
end 
