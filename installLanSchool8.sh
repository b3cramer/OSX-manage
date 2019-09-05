#! bin/bash

# download drivers from AWS S3 bucket

curl -O https://printdrivers.s3.amazonaws.com/v8.0.2.42-lanschool_student.pkg


echo "Installing LanSchool Student v8.0.2.42"
  sudo installer -pkg v8.0.2.42-lanschool_student.pkg -target /
  status=$?
    if [ $status != 0 ]
    then
        echo "Installation of C558 Driver failed. Deleting .PKG file"
        rm v8.0.2.42-lanschool_student.pkg
    fi

echo "Cleaning up..."
  rm v8.0.2.42-lanschool_student.pkg
