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

echo "installing apps..."
brew bundle

brew cleanup
