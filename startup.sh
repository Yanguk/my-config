function print_start() {
  echo "=========================================================================================="
  echo "[START] $1"
  echo "=========================================================================================="
}

function print_end() {
  echo "=========================================================================================="
  echo "[END] $1"
  echo "=========================================================================================="
}

function print_line() {
  echo
  echo "------------------------------------------------------------------------------------------"
  echo
}

# ----------------------------
print_start "homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
print_end "homebrew"
print_line

# ----------------------------
print_start "oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
print_end "oh-my-zsh"
print_line

# ----------------------------
print_start "git"
brew install git
brew install gh
print_end "git"

# ----------------------------
print_start "clone config"
git clone "https://github.com/Yanguk/my-config.git" "${ZSH_CUSTOM:-$HOME}/.config"
print_end "clone config"

# ----------------------------
print_start "brew bundle"
cd ~/.config/homebrew
brew bundle
print_end "brew bundle"

# ----------------------------
print_start "sync zsh config"
ln -sf ~/.config/omz/.zshrc ~/.zshrc
print_end "sync zsh config"

# ----------------------------
print_start "zsh plugins"
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/ntnyq/omz-plugin-pnpm.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/pnpm
print_end "zsh plugins"
