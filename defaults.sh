#!/usr/bin/env bash

###############################################################################
# General UI/UX
###############################################################################

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
# Download updates by default
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate 'AutomaticDownload' -bool true

###############################################################################
# Keyboard, mouse & input
###############################################################################

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
# Disabling auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write -g NSAllowContinuousSpellChecking -bool false
# Keyboard access to all UI controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

###############################################################################
# Screen
###############################################################################

#Requiring password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
#Enabling subpixel font rendering on non-Apple LCDs
# defaults write NSGlobalDomain AppleFontSmoothing -int 2


###############################################################################
# Finder
###############################################################################

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Set Desktop as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"
# Show Removable media on Desktop
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true
# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disabling the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Remove the spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0;

## VIEW STYLE - column view
defaults write com.apple.Finder FXPreferredViewStyle -string "clmv"

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
  General -bool true \
  OpenWith -bool true \
  Privileges -bool true


###############################################################################
# Dock / Dashboard
###############################################################################

# Setting the icon size of Dock items
defaults write com.apple.dock tilesize -int 64
# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
# Don't animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock 'magnification' -bool false
defaults write com.apple.dock 'mineffect' -string 'scale'
# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true
# Don't automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Wipe all (default) app icons from the Dock
defaults write com.apple.dock persistent-apps -array


###############################################################################
# Taskbar
###############################################################################

# Menu bar: show battery percentage, not time remaining
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write com.apple.menuextra.battery ShowTime -string "NO"

# 24-Hour Time
defaults write NSGlobalDomain AppleICUForce12HourTime -bool false

###############################################################################
# Restart services
###############################################################################

killall Finder
killall Dock
killall cfprefsd
killall SystemUIServer

echo "Done. Note that some of these changes require a logout/restart to take effect."
