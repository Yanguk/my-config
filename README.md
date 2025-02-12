# install nix

[nix guide](https://zero-to-nix.com)

````bash
# https://github.com/DeterminateSystems/nix-installer?tab=readme-ov-file#determinate-nix-installer
```bash
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | \
  sh -s -- install
````

# https://github.com/LnL7/nix-darwin

### nix-darwin install

```bash
nix run nix-darwin/master#darwin-rebuild -- switch --flake ~/.config/nix#yanguk
```

### run switch

```bash
darwin-rebuild switch --flake ~/.config/nix#yanguk
```

# zsh

```bash
ln -sf ~/.config/zsh/.zshrc ~/.zshrc
```

# tmux

mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.2 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux

# delta

https://github.com/catppuccin/bat

bat cache --build

# Add colemak-dh

[github](https://github.com/ColemakMods/mod-dh)

1. download Colemak

2. cp -r Colemak\ DH.bundle ~/Library/Keyboard\ Layouts

# 구름 입력기

https://github.com/gureum/gureum
