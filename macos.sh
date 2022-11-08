#!/usr/bin/env bash
set -e
sudo -v

# Kill Preferences app to prevent concurrency
osascript -e 'tell application "System Preferences" to quit'
echo "Killed Preferences app to prevent concurrency"

echo "=================================================="
echo "Setting System Preferences"
echo "=================================================="

echo "[General Preferences]"
echo "Mapping Caps Lock to Esc"
cp ${DOT_PATH}/lib/caps.esc.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/caps.esc.plist 2>/dev/null

echo "Increasing max file descriptors"
sudo cp -f ${DOT_PATH}/lib/limit.maxfiles.plist /Library/LaunchDaemons/limit.maxfiles.plist
sudo chmod 600 /Library/LaunchDaemons/limit.maxfiles.plist
sudo chown root /Library/LaunchDaemons/limit.maxfiles.plist
sudo launchctl load -w /Library/LaunchDaemons/limit.maxfiles.plist 2> /dev/null

echo "Disabling Mouse Acceleration"
defaults write .GlobalPreferences com.apple.mouse.scaling -1

echo "Drag window by clicking anywhere in it and holding cmd + ctrl"
defaults write -g NSWindowShouldDragOnGesture -bool true

echo "Disabling saving the application state on shutdown"
defaults write com.apple.loginwindow TALLogoutSavesState -bool false

echo "Disabling Spotlight indexing of files"
sudo mdutil -a -i off

echo ""
echo "[Dock]"
echo "Enabling autohide"
defaults write com.apple.dock autohide -bool true

echo "Enabling minimize to app icon"
defaults write com.apple.dock minimize-to-application -bool true

echo "Disabling recent apps"
defaults write com.apple.dock show-recents -bool false

echo "Setting size and magnification"
defaults write com.apple.dock tilesize -int 36
defaults write com.apple.dock largesize -int 72
defaults write com.apple.dock magnification -bool true

echo "Reducing show/hide time and delay"
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.5

killall Dock

echo ""
echo "[Finder]"
echo "Enable showing full path in title"
defaults write com.apple.finder ShowPathbar -bool true

echo "Search in current directory by default"
defaults write com.apple.finder FXDefaultSearchScope SCcf
defaults write com.apple.finder FXLastSearchScope SCcf

echo "Enable cut for items"
defaults write com.apple.finder AllowCutForItems -bool true

echo "Disable extension change warning"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "Enable showing all extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "Disable showing network/usb drives on desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true  # show external drives on desktop
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true  # show removeable media on desktop

echo "Disable writing .DS_Store files on network/usb drives"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

killall Finder

echo "SCRIPT DONE"
