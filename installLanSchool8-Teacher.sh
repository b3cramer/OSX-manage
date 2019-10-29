#! bin/bash

# download drivers from AWS S3 bucket

curl -O https://secondarysoftwaredeploy.s3-us-west-2.amazonaws.com/v8.0.2.42-lanschool_teacher.pkg


echo "Installing LanSchool Teacher v8.0.2"
  sudo installer -pkg v8.0.2.42-lanschool_teacher.pkg -target /
  status=$?
    if [ $status != 0 ]
    then
        echo "Installation of LS Teacher v8.0.2 failed. Deleting .PKG file"
        rm v8.0.2.42-lanschool_teacher.pkg
    fi

echo "Cleaning up..."
  rm v8.0.2.42-lanschool_teacher.pkg
