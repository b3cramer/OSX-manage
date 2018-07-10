#!/bin/sh

ADname=`dsconfigad -show | grep -i "Computer Account" | sed -n 's/[^.]*= // ; s/.$//p'`
/bin/echo "<result>$ADname</result>"

exit
