#! bin/bash

# download drivers from AWS S3 bucket

curl -O https://printdrivers.s3.amazonaws.com/958_658e_558_368_367_109.pkg
curl -O https://printdrivers.s3.amazonaws.com/C759_C658_C368_C287_C3851_109.pkg


echo "Installing Drivers for K-M_C558"
  sudo installer -pkg C759_C658_C368_C287_C3851_109.pkg -target /
  status=$?
    if [ $status != 0 ]
    then
        echo "Installation of C558 Driver failed. Deleting .PKG file"
        rm C759_C658_C368_C287_C3851_109.pkg
    fi

echo "Cleaning up..."
  rm C759_C658_C368_C287_C3851_109.pkg

echo "Installing Drivers for K-M_808"
  sudo installer -pkg 958_658e_558_368_367_109.pkg -target /
  status=$?
    if [ $status != 0 ]
    then
        echo "Installation of 808e failed. Deleting .PKG file"
        rm 958_658e_558_368_367_109.pkg
    fi

echo "Cleaning up..."
  rm 958_658e_558_368_367_109.pkg
