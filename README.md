# New laptop setup

Install Brew: https://brew.sh/

2. Run the following output:
```
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/adrianchen/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
cd ~
git clone https://github.com/adrian-chen/dev_environment.git
cd dev_environment
brew bundle
```

## Atom setup
* Settings -> Themes -> Solarized Dark
* Packages -> tree-view -> Settings -> Hide Ignored

## Solarized Dark & Powerline
* Will need to go into Terminal Settings and set Solarized Dark as the default.
* Will also need to set a correct Powerline font. I prefer Meslo M currently.
