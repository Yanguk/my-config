# my-config

/bin/bash ./startup.sh

# gitconfig

cp ~/.config/gitconfig/.gitconfig_back ~/.config/gitconfig/.gitconfig

ln -sf ~/.config/gitconfig/.gitconfig ~/.gitconfig

# tmux

mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.2 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
