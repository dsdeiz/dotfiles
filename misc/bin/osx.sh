#!/usr/bin/env bash

# launchctl load -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist
launchctl unload -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null

# defaults delete com.apple.Dock autohide-delay
defaults write com.apple.Dock autohide-delay -float 1000

# sudo chmod 755 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search
sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search
