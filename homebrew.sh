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

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps... Don't move SourceTree when it asks you to!"
brew bundle

brew cleanup
