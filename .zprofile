export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

source "$HOME/.antigen/antigen.zsh"
antigen use oh-my-zsh
antigen theme romkatv/powerlevel10k
# TODO: use Solarized Dark
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen apply

POWERLEVEL10K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL10K_RIGHT_PROMPT_ELEMENTS=(status time)

bindkey "\e\eOC" forward-word
bindkey "\e\eOD" backward-word

eval "$(/opt/homebrew/bin/brew shellenv)"

alias nuke="make clean && make bootstrap && make open_xcode"
alias lint="SwiftLint --fix"
alias killxcode="killall XCBBuildService"
function ios_branch() {
  if [[ -z "$1" ]]; then
    echo "Usage: $0 <branch_name>"
    return 1
  fi

  arc feature $1 && git submodule update --init
}
