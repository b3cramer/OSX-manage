#!/bin/sh
#Silent install Homebrew - Requires pw.sh be stored in /User/$USER/bin with 100 permissions
CI=1 /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


echo "Checking for Applications: Chrome and Firefox..."
./removeApplicationsList.sh

#Install wget
echo "Homebrew Cask install applications..."
brew install wget

brew tap caskroom/cask

# Core Functionality
echo "installing core 3rd-Party Applications"
brew cask install --appdir="~/Applications" vlc
brew cask install --appdir="~/Applications" java
brew cask install flash-npapi
brew cask install flash-player
brew install mas

# Google Applications
echo "Install Google Apps | Chrome not included cause of 1Password Plugin"
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" google-drive-file-stream

# Nice to have
echo "Installing Some additional Apps"
brew cask install --appdir="/Applications" firefox

# download 4070 driver DMG from the internet
curl -# -O http://www.sharp-world.com/restricted/products/copier/downloads/search/files/001795/MX-C52_1804a_Mac104-1013.dmg
echo "Installing MX-C52 driver for Sharp 4070 MFP"
echo "mounting DMG"
  hdiutil attach MX-C52_1804a_Mac104-1013.dmg
  cd /Volumes/MX-C52/MacOSX/Version\ 10.9
  sudo installer -pkg MX-C52.pkg -target "/" -allowUntrusted
echo "umounting the DMG"
  cd ~
  diskutil umount /Volumes/MX-C52
  status=$?
    if [ $status != 0 ]
    then
        echo "DMG Unmount failed. Removing Directory"
        rmdir /Volumes/MX-C52
    fi
echo "Cleaning up"
  rm /MX-C52_1804a_Mac104-1013.dmg

#download 565 driver DMG from the internet
curl -# -O http://www.sharp-world.com/restricted/products/copier/downloads/search/files/001801/MX-C26_1711a_Mac104-1012.dmg
echo "Installing MX-C52 for Sharp 565 MFP"
echo "mounting DMG"
  hdiutil attach MX-C26_1711a_Mac104-1012.dmg
  cd /Volumes/MX-C26/MacOSX/Version\ 10.10
  sudo installer -pkg MX-C26.pkg -target "/" -allowUntrusted
echo "umounting the DMG"
  cd ~
  diskutil umount /Volumes/MX-C26
  status=$?
    if [ $status != 0 ]
    then
        echo "DMG Unmount failed. Removing Directory"
        rmdir /Volumes/MX-C26
    fi
echo "Cleaning up"
  rm MX-C26_1711a_Mac104-1012.dmg

# cleanup
echo "Cleaning up"

brew cleanup --force
rm -f -r /Library/Caches/Homebrew/*
