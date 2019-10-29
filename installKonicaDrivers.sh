#! bin/bash

# download drivers from AWS S3 bucket

curl -O https://secondarysoftwaredeploy.s3-us-west-2.amazonaws.com/KM-808e-Driver.pkg
curl -O https://secondarysoftwaredeploy.s3-us-west-2.amazonaws.com/KM-C558-Driver.pkg


echo "Installing Drivers for K-M_C558"
  sudo installer -pkg KM-C558-Driver.pkg -target /
  status=$?
    if [ $status != 0 ]
    then
        echo "Installation of C558 Driver failed. Deleting .PKG file"
        rm KM-C558-Driver.pkg
    fi

echo "Cleaning up..."
  rm KM-C558-Driver.pkg

echo "Installing Drivers for K-M_808"
  sudo installer -pkg KM-808e-Driver.pkg -target /
  status=$?
    if [ $status != 0 ]
    then
        echo "Installation of 808e Driver failed. Deleting .PKG file"
        rm KM-808e-Driver.pkg
    fi

echo "Cleaning up..."
  rm KM-808e-Driver.pkg
