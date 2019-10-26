#!/bin/bash
#
# Script that shows how to make sure that user input is provided

if [ -z $1 ]
then
            echo provide filenames
            read FILENAMES
else
            FILENAMES="$@"
fi

echo the following filenames have been provided: $FILENAMES
