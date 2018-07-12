#!/bin/sh


echo "Checking for Applications: Chrome and Firefox..."

#remove Google Chrome
if [[ -d "/Applications/Google Chrome.app" && ! -L "/Applications/Google Chrome.app" ]]
then
  echo " /Applications/Google Chrome.app exists."
  echo "Removing /Applications/Google Chrome.app"
  rm -R /Applications/Google\ Chrome.app
else
  echo "Google Chrome does not exist in /Applications on this machine."
fi


#remove Firefox
if [[ -d "/Applications/Firefox.app" && ! -L "/Applications/Firefox.app" ]]
then
  echo " /Applications/Firefox.app exists."
  echo "Removing /Applications/Firefox.app"
  rm -R /Applications/Firefox.app
else
  echo "Firefox does not exist in /Applications on this machine."
fi
