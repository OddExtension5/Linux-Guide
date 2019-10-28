#!/bin/bash
#
# This script copies /var/log/messages contents and clears current contents of the file
# Usage: ./clearlogs_var

LOGFILE=/var/log/messages

cp $LOGFILE $LOGFILE.old
cat /dev/null > $LOGFILE

echo log file copied and cleaned up

exit 0
