#!/bin/bash
#
# Example of a scripted FTP session

lftp localhost <<EndOfSession
ls
get hosts
bye
EndOfSession

echo the file is now downloaded
