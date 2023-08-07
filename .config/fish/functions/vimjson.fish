function vimjson --description "Pipe JSON to vim for easy viewing"
    command vim - -c 'set ft=json' -R;
end
