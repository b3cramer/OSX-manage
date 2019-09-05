#!/bin/bash
if [ "$(whoami)" != "administrator" ]; then
  echo "switching user to local admin account"
  SUDO_ASKPASS=${HOME}/bin/pw.sh su administrator
fi

brew doctor

exit
