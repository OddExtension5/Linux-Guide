# Exit codes are a number between 0 and 255, which is returned by any Unix command when it returns control to its parent proceess.
# Other numbers can be used, but these are treated modulo 256, so exit -10 is equivalent to exit 246, and exit 257 is equivalent to exit 1.

# 0 - OK, 1 - General Error, 2 - Misuse of shell builtin, 126 - Cannot execute, 127 - No file found matching command
# 128 - Invalid exit value
# (128+n) - Process killed with signal 'n'

# GNU grep return 0 on success, 1 if no matches were found, and 2 for other errors (syntax errors, non-existent input files, etc).

# $? variable is set to the return code of the last executed command.

# RUN COMMANDS ----------

ls
echo $?                     # exit code of last executed command
doesnotexist
echo $?
bash

function trycmd {
      $1
      if [[ $? -eq 127 ]]
      then
              echo 'What are you doing?'
      fi
}

trycmd ls
trycmd notexist
exit
echo 'grepme' > afile.txt
grep not_there afile.txt
echo $?

if grep grepme afile.txt
then
        echo 'matched!'
fi

bash
exit 67
echo $?
bash

function trycmd {
       $1
       if [[ $? -eq 127 ]]
       then
                echo "What are you doing!"
                return 1
        fi
}

trycmd ls
trycmd notexist
exit
return 1
echo $$


