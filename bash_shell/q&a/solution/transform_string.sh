#!/bin/bash

USER=cn=lara,dc=example,dc=com
USER=${USER%%,*}
USER=${USER#*=}
USER=$(echo $USER | tr [:lower:] [:upper:])

echo the username is $USER
