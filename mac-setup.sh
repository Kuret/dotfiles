#!/bin/sh

# Set hostname
sudo scutil --set HostName "rick-mbp"
sudo scutil --set LocalHostName "rick-mbp"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName "rick-mbp"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server ServerDescription "rick-mbp"

# Set DNS to CloudFlare
sudo networksetup -setdnsservers Wi-Fi \
  1.1.1.1 \
  1.0.0.1 \
  2606:4700:4700::1111 \
  2606:4700:4700::1111

# Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder CreateDesktop -bool false
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock show-recents -bool false

defaults write com.apple.dock tilesize -int 32;
defaults write com.apple.dock largesize -int 64;

defaults write com.apple.dock wvous-bl-corner -int 1;
defaults write com.apple.dock wvous-br-corner -int 1;
defaults write com.apple.dock wvous-tl-corner -int 1;
defaults write com.apple.dock wvous-tr-corner -int 1;

# UI Stuff
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.spaces spans-displays -bool false
defaults write .GlobalPreferences com.apple.mouse.scaling -1

# Move windows by draging any part of the window with cmd+ctrl (instead of only the window title)
defaults write -g NSWindowShouldDragOnGesture YES

# Login / Security
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false
sudo defaults write /Library/Preferences/com.apple.loginwindow SHOWOTHERUSERS_MANAGED -bool false
sudo defaults write /Library/Preferences/com.apple.loginwindow SHOWFULLNAME -bool false

# Restart apps to apply changes
killall Finder
killall Dock
