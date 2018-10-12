# Setup for AWS EB CLI
export PATH=LOCAL_PATH:$PATH

source "$HOME/.antigen/antigen.zsh"
antigen use oh-my-zsh
antigen theme agnoster # Layout, not color scheme
# TODO: use Solarized Dark
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen apply
