#!/bin/sh

#remove all user accounts from DSLab machines beginning in August 2018.
#run this script at the end of each school year.
#if there are more accounts that need to be ignored, add them in the userList variable using the format: -not -name "accountName"

userList=$(find /Users -type d -maxdepth 1 -mindepth 1 -not -name "." -not -name "administrator" -not -name "minecraft" -not -name "frontier" -not -name "pattong" -not -name "Shared" -not -name "Guest" -mtime +7 | awk -F'/' '{print $NF}')

for a in $userList ; do
      rm -R /Users/"$a"; #delete the home directory
      dscl . delete /Users/"$a" # Deleting the entry from dir services
      echo "$a has been deleted"
      let counter=$((counter+1))
done
