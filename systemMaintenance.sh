#!/bin/bash

#system updates using homebrew
echo "Checking for updates..."
brew update
brew upgrade

echo "Cleaning up..."
brew cleanup -s
brew cask cleanup

#now diagnotic
echo "Running diagnostics..."
brew doctor
brew missing

#now check app store updates
echo "Checking for outdated applications in the App Store..."
mas upgrade

echo "Your system is all updated and cleaned up!"
