#!/bin/bash

callSudo() {
	sudo -S -v <<< 'passwordstring' 2> /dev/null
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
}


installPicasa39() {

hdiutil mount /tmp/picasamac39.dmg && sudo cp -R "/Volumes/Picasa 3.9.138"
echo "cleaning up..."
rm -R picasamac39.dmg

echo "All done."
}


callSudo
installPicasa39
