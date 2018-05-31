#!/bin/sh
read -p "Press any key to continue... " -n1 -s
echo  '\n'

echo "Installing Xcode cli tools..."
xcode-select --install

#echo "Installing Homebrew"
#ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#Install wget
echo "Homebrew Cask install applications..."
brew install wget

brew tap caskroom/cask

# Core Functionality
brew cask install --appdir="~/Applications" vlc
brew cask install --appdir="~/Applications" java
brew cask install flash
brew cask install flash-npapi
brew cask install flash-player


# get from App Store
#brew cask install --appdir="/Applications" evernote
#brew cask install --appdir="/Applications" wunderlist
#brew cask install --appdir="/Applications" clamxav


# Google Slavery
echo Install Google Apps | Chrome not included cause of 1Password Plugin
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" google-drive-file-stream

# Nice to have
echo Install Some additional Apps
brew cask install --appdir="/Applications" firefox

# cleanup
brew cleanup --force
rm -f -r /Library/Caches/Homebrew/*
