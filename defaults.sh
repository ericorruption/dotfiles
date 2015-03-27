# Wipe all (default) app icons from the Dock
#defaults write com.apple.dock persistent-apps -array


# Hide the Time Machine, Volume, User, and Bluetooth icons
for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
    defaults write "${domain}" dontAutoLoad -array \
      "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
      "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
      "/System/Library/CoreServices/Menu Extras/Volume.menu" \
      "/System/Library/CoreServices/Menu Extras/User.menu"
  done

  defaults write com.apple.systemuiserver menuExtras -array \
    "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
    "/System/Library/CoreServices/Menu Extras/Battery.menu" \
    "/System/Library/CoreServices/Menu Extras/Clock.menu"

# Save to disk instead of iCloud
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Disable hibernation
sudo pmset -a hibernatemode 0

# Return from sleep faster
sudo pmset -a standbydelay 86400

## VIEW STYLE
defaults write com.apple.Finder FXPreferredViewStyle clmv

defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

## SAFARI DEV EDITION
defaults write com.apple.Safari ShowFavoritesBar -bool false
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

## SHOW LIBRARY FOLDER
#chflags nohidden ~/Library

# Disable menubar transparency
defaults write com.apple.universalaccess reduceTransparency -bool true


defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder AppleShowAllFiles TRUE
defaults write NSGlobalDomain AppleShowAllExtensions -bool true


#
# SCREEN
#
#Requiring password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
#Enabling subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2


#
# FINDER
#

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true
# Disabling the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false


#
# DOCK
#

# Setting the icon size of Dock items
defaults write com.apple.dock tilesize -int 60
# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
# Don't animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false


#
# Others
#

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true
# Don't automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false
# Increasing the window resize speed for Cocoa applications
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
# Disabling auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# Disable the "Are you sure you want to open this application?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false
# Disable time machine
hash tmutil &> /dev/null && sudo tmutil disablelocal


killall Finder
killall Dock
killall cfprefsd
killall SystemUIServer