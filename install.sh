#----------------------------#
# Symlink all files to $HOME #
#----------------------------#

# We don't want to continue if any errors
set -e

# Should be more elegant in the future...
# More to come. Maybe.
ln -s "bashrc" "$HOME/.bashrc"
ln -s "alias" "$HOME/.alias"
ln -s "gitconfig" "$HOME/.gitconfig"
ln -s "gitignore_global" "$HOME/.gitignore_global"
ln -s "tmux.conf" "$HOME/.tmux.conf"
