# Install Xcode Command Line Tools
if [[ ! -d /Library/Developer/CommandLineTools ]]; then
  xcode-select --install
  printf "\nTo continue, please rerun this script after the Xcode Command Line Tools are installed.\n"
  exit 1
fi

# Install Homebrew and bundled packages
if ! command -v brew >/dev/null 2>&1; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew doctor
brew update
brew bundle

# Download Homebrew uninstaller
wget -nc -P $(brew --prefix)/bin https://gist.githubusercontent.com/mxcl/1173223/raw/a833ba44e7be8428d877e58640720ff43c59dbad/uninstall_homebrew.sh
chmod +x $(brew --prefix)/bin/uninstall_homebrew.sh

# Atom packages
gem install rubocop
apm install linter
apm install linter-rubocop
apm install pigments
apm install symbol-gen

echo "Add to ~/.atom/config.cson"
echo "'linter-rubocop':"
echo "  'executablePath': '<(rbenv) which rubocop>'"

# Install Antigen
git clone https://github.com/zsh-users/antigen.git "$HOME/.antigen" || true

# Change default shell if necessary
ZSH_PATH="$(brew --prefix)/bin/zsh"
if [[ "$SHELL" != "$ZSH_PATH" ]]; then
  sudo chsh -s "$ZSH_PATH" "$USER"
fi

# Download Solarized theme for iTerm2
for f in Solarized%20Dark.itermcolors Solarized%20Light.itermcolors; do
  wget -nc -P "$HOME/Documents" "https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/$f"
done

# Zsh settings
symlink '.z*' "$HOME"
mkdir -p "$HOME/.zprofile.d"

# iTerm2 shell integration
# TODO: Add powerline stuff, could maybe go in .zprofile

# Github setup
cp git_config/.gitconfig ~/.gitconfig
cp git_config/.gitignore ~/.gitignore
git config --global core.excludesfile ~/.gitignore

printf "\nDone!\n"
