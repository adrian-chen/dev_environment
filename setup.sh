# Install Xcode Command Line Tools
if [[ ! -d /Library/Developer/CommandLineTools ]]; then
  xcode-select --install
  printf "\nTo continue, please rerun this script after the Xcode Command Line Tools are installed.\n"
  exit 1
fi

# Install Homebrew and bundled packages
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
brew doctor
brew update
brew tap microsoft/git
brew bundle

# Powerline Fonts
pip install --user powerline-status
git clone https://github.com/powerline/fonts.git
./fonts/install.sh # install
rm -rf fonts  # cleanup

# Fish shell setup
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
fisher install jorgebucaran/fisher IlanCosman/tide@v6 edc/bass
cp config.fish ~/.config/fish/config.fish
tide configure

# Setup pip
sudo easy_install pip

# Node
curl -fsSL https://fnm.vercel.app/install | bash
fvm install 24
npm install -g @anthropic-ai/claude-code

# Github setup
cp git_config/.gitconfig ~/.gitconfig
cp git_config/.gitignore ~/.gitignore
git config --global core.excludesfile ~/.gitignore
gh auth login

printf "\nDone! Make sure you setup fish as your default shell in iterm `/opt/homebrew/bin/fish` and setup your color scheme.\n"
