export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
source "$HOME/.antigen/antigen.zsh"
antigen use oh-my-zsh
antigen theme bhilburn/powerlevel9k powerlevel9k
# TODO: use Solarized Dark
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen apply
