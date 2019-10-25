# PIPELINES:
#   The ability of command to read data from standard input and send to standard output is utilized by a shell feature called pipelines.
#   Using the pipeline operator | (vertical bar), the stdout of one command can be piped into stdinput of another.
#                  command1 | command2

# Pipe is used to combine two or more command and in this the output of one command act as input to another command 
# and this command ouput may act as a input to next command as so on.

#                                                    |--------------   ls -l > temp
#   ls -l | less       can also be written as :  ----|
#                                                    |--------------   less < temp

# FILTERS
#  Pipelines are often used to perform complex operations on data.
#  It is possible to put several commands together into a pipeline.
#  Frequently, the command used this way are referred to as filters.
#    ls /bin /bin/usr | sort | less




# COMMANDS

mkdir itb_pipes_redirects
cd itb_pipes_redirects
echo "contents of file1" > file1
cat file1
cat file1 | grep -c file                          # print a count of matching lines for input files
cat file1 | grep 'contents of file1'
cat file1 | grep 'not in file'
cat file2
cat file2 | grep -c file
echo asd > /dev/stdout
ls -l /dev/stdout
cat file2 | grep -c file
command_does_not_exist
command_does_not_exist 2> /dev/null
grep -c file < file1                              # Using < redirection operator, we change the source of std input from the keyboard to the file1
echo line1 > file3
echo line2 > file3
echo line3 >> file3                               # >> used to append redirected output to a file instead of overwriting the file from the beginning
cat file3
