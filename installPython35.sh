#!/bin/bash

callSudo() {
	sudo -S -v <<< 'Carbonsteel44%' 2> /dev/null
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
}

installPython() {

curl https://www.python.org/ftp/python/3.5.4/python-3.5.4-macosx10.6.pkg -o python35.pkg

sudo installer -pkg python35.pkg -target /

echo "cleaning up..."
rm -R python35.pkg

echo "All done."
}

callSudo
installPython
