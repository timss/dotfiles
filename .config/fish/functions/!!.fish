# https://gist.github.com/b-/981892a65837ab0a387e
function !! --description "Run last command"
    eval $history[1] $argv;
end
