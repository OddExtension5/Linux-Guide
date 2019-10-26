#!/bin/bash
#
# Script that shows how text to be sent by wall is feeded through a here document
# wall -> write all

wall <<EndOfMessage
The menu for today is:
1.        Healthy soup and salad
2.        Boiled Eggs
3.        Chips and fish
4.        Steak with carrots
EndOfMessage
