#!/bin/sh

echo "Deleting home directory for the following users…"

userList=`find /Users -type d -maxdepth 1 -mindepth 1 -not -name "*.*" -not -name "administrator" -not -name "Shared" -not -name "Guest" -mtime +7 | awk -F'/' '{print $NF}'`

for a in $userList ; do

echo "$a"

done
