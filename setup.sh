# Install Xcode Command Line Tools
if [[ ! -d /Library/Developer/CommandLineTools ]]; then
  xcode-select --install
  printf "\nTo continue, please rerun this script after the Xcode Command Line Tools are installed.\n"
  exit 1
fi

# Install Homebrew and bundled packages
if ! command -v brew >/dev/null 2>&1; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
brew doctor
brew update
brew bundle

# Setup pip
xcode-select --install
sudo easy_install pip

# Atom packages
gem install rubocop
apm install linter
apm install linter-rubocop
apm install pigments
apm install symbol-gen
apm install atom-typescript
apm install atom-ide-ui

echo "Add to ~/.atom/config.cson"
echo "'linter-rubocop':"
echo "  'executablePath': '<(rbenv) which rubocop>'"

# Install Antigen
git clone https://github.com/zsh-users/antigen.git "$HOME/.antigen" || true

# Powerline for Mac Terminal
pip install --user powerline-status
git clone https://github.com/powerline/fonts.git
./fonts/install.sh # install
rm -rf fonts  # cleanup

# Solarized for Mac Terminal
open Solarized\ Dark.terminal # import into terminal

# Zsh settings
ln -s '.z*' "$HOME"
cp .zprofile ~/.zprofile

# Github setup
cp git_config/.gitconfig ~/.gitconfig
cp git_config/.gitignore ~/.gitignore
git config --global core.excludesfile ~/.gitignore

printf "\nDone! Make sure you install the recommended powerline10k fonts: https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k\n"
