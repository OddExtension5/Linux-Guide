#!/bin/bash

BLAH=rababarabarabarara

echo BLASH is $BLAH
echo 'The result of ##*ba is' ${BLAH##*ba}     # rara
echo 'The result of #*ba is' ${BLAH#*ba}       # barabarabarara
echo 'The result of %%ba* is' ${BLAH%%ba*}     # ra
echo 'The result of %ba* is' ${BLAH%ba*}       # rababarabara
