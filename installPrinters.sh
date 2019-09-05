#! bin/bash

#download Lexmark C6160 Driver for MacOSX
curl -# -O http://www.downloaddelivery.com/downloads/drivers/Lexmark_AEP_PrinterSoftware_04032017.dmg
echo "Installing Lexmark_AEP_PrinterSoftware_04032017 driver for Lexmark C6160"
echo "mounting DMG"
  hdiutil attach Lexmark_AEP_PrinterSoftware_04032017.dmg
  cd /Volumes/Lexmark_AEP_Printer\ Software\ v\ 2.0.0/
  sudo installer -pkg C6100_Series_Print.pkg -target "/" -allowUntrusted
echo "umounting the DMG"
  cd ~
  diskutil umount /Volumes/Lexmark_AEP_Printer\ Software\ v\ 2.0.0/
  status=$?
    if [ $status != 0 ]
    then
        echo "DMG Unmount failed. Removing Directory"
        rmdir /Volumes/Lexmark_AEP_Printer\ Software\ v\ 2.0.0/
    fi
echo "Cleaning up"
  rm Lexmark_AEP_PrinterSoftware_04032017.dmg
echo "Install Complete"

#install Lexmark C6160
sudo lpadmin -p OfficeLexmark -L "Front Office" -E -v ipp://10.1.4.10 -P /Library/Printers/PPDs/Contents/Resources/Lexmark\ C6100\ Series.gz
