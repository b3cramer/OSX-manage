#!/bin/bash


callSudo() {
	sudo -S -v <<< 'passwordstring' 2> /dev/null
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
}

brewInstall() {
  CI=1 /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install wget
  brew tap caskroom/cask
}

brewCaskInstall() {
  export RED='\033[0;31m'
  export NC='\033[0m'

  # update the list below with casks needed on the target machine with the target /Applications.
  casksApplications=(java vlc google-chrome google-drive-file-stream firefox sketchup virtualbox)

  # update the list below with flash plugins needed on the target machine.
  casksFlash=(flash-npapi flash-player)

  echo "install core applications..."
    for item in "${casksApplications[@]}"
    do
      brew cask install --appdir="/Applications" "$item"
      status=$?
      if [ $status != 0 ]
      then
        echo "${RED}cask "$item" failed to install${NC}"
      fi
    done

  echo "install Flash plugins..."
    for item in "${casksFlash[@]}"
    do
      brew cask install "$item"
      status=$?
      if [ $status != 0 ]
      then
        echo "${RED}cask "$item" failed to install${NC}"
      fi
    done
}

removeAppStoreApps() {
	applications=(Keynote.app Pages.app Numbers.app)
	echo "removing unneeded applications..."
		for item in "${applications[@}]}"
		do
			sudo rm -R /Applications/"$item"
			status=$?
			if [$status != 0]
			then
				echo "${RED}Application "$item" failed to uninstall...${NC}"
			fi
		done
}

callSudo
brewInstall
brewCaskInstall
