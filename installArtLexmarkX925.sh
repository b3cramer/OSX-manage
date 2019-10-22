#download Lexmark X920Series Driver for MacOSX
curl -O http://www.downloaddelivery.com/downloads/drivers/Lexmark_ADB_PrinterSoftware_12152016.dmg
echo "Installing driver for Lexmark X925"
echo "mounting DMG"
  hdiutil attach Lexmark_ADB_PrinterSoftware_12152016.dmg
  cd /Volumes/Lexmark_ADB_Printer\ Software\ v\ 2.0.0/
  sudo installer -allowUntrusted -pkg X920_Series_Print_Scan.pkg -target "/"
echo "umounting the DMG"
  cd ~
  diskutil umount /Volumes/Lexmark_ADB_Printer\ Software\ v\ 2.0.0/
  status=$?
    if [ $status != 0 ]
    then
        echo "DMG Unmount failed. Removing Directory"
        rmdir /Volumes/Lexmark_ADB_Printer\ Software\ v\ 2.0.0/
    fi
echo "Cleaning up"
  rm Lexmark_ADB_PrinterSoftware_12152016.dmg
echo "Install Complete"

#install Lexmark X925
#echo "Installing Printer on local system..."
#sudo lpadmin -p Art_Lexmark_X925 -L "Art Room Lexmark X925" -o printer-is-shared="False" -E -v https://10.1.2.237:631/printers/Art_Lexmark_X925 -P /Library/Printers/PPDs/Contents/Resources/Lexmark\ X920\ Series.gz
