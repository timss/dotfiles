# https://gist.github.com/b-/981892a65837ab0a387e
function !! --description "Run last command"
    if not test $history[1] = "!!"
        eval $history[1] $argv;
    else
        # repeated !! will be deduplicated in $history
        eval $history[2] $argv;
    end
end
