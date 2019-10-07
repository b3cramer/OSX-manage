#!/bin/bash

#Run with global admin acocunt from JC on managed systems

installPython() {

mkdir /tmp/python && cd /tmp/python
curl https://www.python.org/ftp/python/3.5.4/python-3.5.4-macosx10.6.pkg -o python35.pkg

sudo installer -allowUntrusted -pkg python35.pkg -target /

echo "cleaning up..."
cd ~
rm -Rf /tmp/python

echo "The snakes are ready to slither..."
}


installPython
