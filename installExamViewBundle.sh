#! bin/bash

# download application packages from AWS S3 and install at "/"

curl -O https://printdrivers.s3.amazonaws.com/ExamView_Mac.pkg
echo "Exam View for Mac is installing now..."
  sudo installer -allowUntrusted -pkg ExamView_Mac.pkg -target /

curl -O https://printdrivers.s3.amazonaws.com/ExamView+Installer.pkg
echo "ExamView content is installing now..."
  sudo installer -allowUntrusted -pkg ExamView+Installer.pkg -target /

curl -O https://printdrivers.s3.amazonaws.com/ExamView+Player+Installer.pkg
echo "ExamView Player is installing now..."
  sudo installer -allowUntrusted -pkg ExamView+Player+Installer.pkg -target /

echo "Cleaning up..."
 rm -f ExamView_Mac.pkg
 rm -f ExamView+Installer.pkg
 rm -f ExamView+Player+Installer.pkg
