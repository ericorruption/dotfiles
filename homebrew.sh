# Run all updates that are possible from the App Store.
sudo softwareupdate -ia --agree-to-license

# Install Xcode
xcode-select --install

bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/ericquanz/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew doctor
brew update
brew upgrade

echo "installing apps..."
brew bundle

brew cleanup
