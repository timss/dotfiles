#----------------------------#
# Symlink all files to $HOME #
#----------------------------#

# We don't want to continue if any errors
set -e

# Should be more elegant in the future...
ipath=`pwd`

for f in alias bashrc gitconfig gitignore_global screenrc tmux.conf vimperatorrc; do
    ln -s "$ipath/$f" "$HOME/.$f"
done

mkdir -p $HOME/.config/terminator/
ln -s "$ipath/terminator_config" "$HOME/.config/terminator/config"
