bindkey "\e\eOC" forward-word
bindkey "\e\eOD" backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word

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
