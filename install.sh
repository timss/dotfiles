#----------------------------#
# Symlink all files to $HOME #
#----------------------------#

# We don't want to continue if any errors
set -e

# Should be more elegant in the future...
ln -s "bashrc" "$HOME/.bashrc"
ln -s "alias" "$HOME/.alias"
