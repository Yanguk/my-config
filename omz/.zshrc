export LANG=en_US.UTF-8

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

plugins=(
  git
  autojump
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# terminal
export TERM="xterm-256color"
[[ -n $TMUX ]] && export TERM="tmux-256color"

# lazyGit
export XDG_CONFIG_HOME="$HOME/.config"

# git
alias gs="git status"
alias gb="git branch"
alias gl="git log --oneline"
alias gw="git switch"

# neoVim
alias vim="nvim"
alias vi="nvim"

# knowre ------------------
# gettext
# export PATH="/opt/homebrew/bin/gettext/bin:$PATH"
alias envrc_to_env="cp -f .envrc .env"

# direnv
# eval "$(direnv hook zsh)"

source /Users/yanguk/.docker/init-zsh.sh || true # Added by Docker Desktop

# [ -f "/Users/yanguk/.ghcup/env" ] && source "/Users/yanguk/.ghcup/env" # ghcup-env

