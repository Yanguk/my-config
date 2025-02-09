# my-config

/bin/bash ./startup.sh

# gitconfig

cp ~/.config/gitconfig/.gitconfig_back ~/.config/gitconfig/.gitconfig

ln -sf ~/.config/gitconfig/.gitconfig ~/.gitconfig

# tmux

mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.2 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux

# delta

https://github.com/catppuccin/bat

brew install bat
bat cache --build

# Add colemak-dh

[github](https://github.com/ColemakMods/mod-dh)

1. download Colemak

2. cp -r Colemak\ DH.bundle ~/Library/Keyboard\ Layouts

# 구름 입력기

https://github.com/gureum/gureum

# install nix

```bash
# https://nixos.org/download/
sh <(curl -L https://nixos.org/nix/install)

# https://github.com/LnL7/nix-darwin
nix run nix-darwin/master#darwin-rebuild -- switch --flake ~/.config/nix#Yanguk

# or
ln -sf ~/.config/nix/flake.nix /etc/nix-darwin/flake.nix

# or
cd ~/.config/nix
darwin-rebuild switch --flake .#Yanguk
```
