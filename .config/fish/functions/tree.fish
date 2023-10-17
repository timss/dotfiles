function tree --description "List contents of directories in a tree-like format"
    command tree -C --dirsfirst -F -l $argv;
end
