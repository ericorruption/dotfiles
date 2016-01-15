# Run all updates that are possible from the App Store.
sudo softwareupdate -iva

# Install Xcode
xcode-select --install

if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew doctor
brew update
brew upgrade
brew install git node bash zsh ios-sim mongodb mysql homebrew/php/php56 ruby sqlite

# Apps
apps=(
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
  sequel-pro

  spotify

  qlstephen
  qlimagesize
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew tap caskroom/versions
brew cask install --appdir="/Applications" ${apps[@]}
brew cleanup
