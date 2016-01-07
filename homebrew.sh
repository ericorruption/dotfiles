# Run all updates that are possible from the App Store.
xcode-select --install

if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew doctor
brew update
brew upgrade
brew install git node bash zsh tidy-html5 caskroom/cask/brew-cask
brew cleanup

# Apps
apps=(
  asepsis
  caffeine
  appcleaner
  the-unarchiver
  spectacle

  google-chrome
  firefoxdeveloperedition
  opera
  filezilla
  vagrant
  virtualbox
  iterm2-nightly
  atom
  sourcetree

  spotify

  qlstephen
  qlimagesize
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew tap caskroom/versions
brew cask install --appdir="/Applications" ${apps[@]}