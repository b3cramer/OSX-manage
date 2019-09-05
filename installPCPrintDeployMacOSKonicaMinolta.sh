#! bin/bash

# download drivers from AWS S3 bucket

curl -O https://printdrivers.s3.amazonaws.com/ExamView_Mac.pkg


echo "Exam View for Mac is installing now..."
  sudo installer -allowUntrusted -pkg ExamView_Mac.pkg -target /
  status=$?
    if [ $status != 0 ]
    then
        echo "Installation of PC Print Deploy failed. Deleting .PKG file"
        rm ExamView_Mac.pkg
    fi

echo "Cleaning up..."
  rm ExamView_Mac.pkg
