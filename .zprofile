export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme
source "$HOME/.antigen/antigen.zsh"
antigen use oh-my-zsh
antigen theme bhilburn/powerlevel9k powerlevel9k
# TODO: use Solarized Dark
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen apply

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)

bindkey "\e\eOC" forward-word
bindkey "\e\eOD" backward-word
