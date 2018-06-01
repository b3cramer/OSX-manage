#! bin/bash

# download 4070 driver DMG from the internet
curl -# -O http://www.sharp-world.com/restricted/products/copier/downloads/search/files/001795/MX-C52_1804a_Mac104-1013.dmg
echo "Installing MX-C52 driver for Sharp 4070 MFP"
echo "mounting DMG"
  hdiutil attach MX-C52_1804a_Mac104-1013.dmg
  cd /Volumes/MX-C52/MacOSX/Version\ 10.9
  sudo installer -pkg MX-C52.pkg -target "/"
echo "umounting the DMG"
  cd ~
  diskutil umount /Volumes/MX-C52
  status=$?
    if [ $status != 0 ]
    then
        echo "DMG Unmount failed. Removing Directory"
        rmdir /Volumes/MX-C52
    fi
echo "Cleaning up"
  rm /MX-C52_1804a_Mac104-1013.dmg

#download 565 driver DMG from the internet
curl -# -O http://www.sharp-world.com/restricted/products/copier/downloads/search/files/001801/MX-C26_1711a_Mac104-1012.dmg
echo "Installing MX-C52 for Sharp 565 MFP"
echo "mounting DMG"
  hdiutil attach MX-C26_1711a_Mac104-1012.dmg
  cd /Volumes/MX-C26/MacOSX/Version\ 10.10
  sudo installer -pkg MX-C26.pkg -target "/"
echo "umounting the DMG"
  cd ~
  diskutil umount /Volumes/MX-C26
  status=$?
    if [ $status != 0 ]
    then
        echo "DMG Unmount failed. Removing Directory"
        rmdir /Volumes/MX-C26
    fi
echo "Cleaning up"
  rm MX-C26_1711a_Mac104-1012.dmg

#download Lexmark C6160 Driver for MacOSX
curl -# -O http://www.downloaddelivery.com/downloads/drivers/Lexmark_AEP_PrinterSoftware_04032017.dmg
echo "Installing Lexmark_AEP_PrinterSoftware_04032017 driver for Lexmark C6160"
echo "mounting DMG"
  hdiutil attach Lexmark_AEP_PrinterSoftware_04032017.dmg
  cd /Volumes/Lexmark_AEP_Printer\ Software\ v\ 2.0.0/
  sudo installer -pkg C6100_Series_Print.pkg -target "/"
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
