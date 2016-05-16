function sudoedit --description "Execute a command as another user"
    # preserve env and filetype detection
    # https://github.com/tpope/vim-eunuch/issues/31
    set -lx SUDO_COMMAND "sudoedit $argv";
    command sudoedit $argv;
end
