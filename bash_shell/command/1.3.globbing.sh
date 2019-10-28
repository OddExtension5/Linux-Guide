# File globbing is a feature provided by the UNIX/Linux shell to represent multiple filenames by using
# special characters called wildcard with a single file name.

# Wildcards: Special characters to help you rapidly specify group of filenames.
# Using wildcards allow you to select filenames based on patterns of characters

#  |----------------------------|------------------------------------------------------------------|
#  |      Wildcard              |                 Matches                                          |
#  |----------------------------|------------------------------------------------------------------|
#  |         *                  |             Any characters                                       |
#  |         ?                  |             Any single characters                                |
#  |      [characters]          |             Any char i.e., member of the set char                |
#  |      [!characters]         |             Any char i.e., not a member of the set char          |
#  |      [[:class:]]           |             Any char i.e., member of the specified class         |
#  |----------------------------|------------------------------------------------------------------|

# ** Wildcards can be used with any command that accepts filename as arguments.

# Commonly used characters classes
#            [:alnum:]        ---->        Any alphanumeric char
#            [:alpha:]        ---->        Any alphabetic char
#            [:digit:]        ---->        Any numeral
#            [:lower:]        ---->        Any lowercase letter
#            [:upper:]        ---->        Any uppercase letter


#  |------------------------------------------------------------------------------------------------------------------------|
#  |                                   WILDCARD EXAMPLES                                                                    |
#  |------------------------------------------------------------------------------------------------------------------------|
#  |           Pattern                     |                                      Matches                                   |
#  |---------------------------------------|--------------------------------------------------------------------------------|
#  |           *                           |  All Files                                                                     |
#  |           g*                          |  Any file beginning with g                                                     |
#  |           b*.txt                      |  Any file beginning with b followed by any characters & ending with .txt       |
#  |           Data???                     |  Any file beginning with Data followed by exactly three characters             |
#  |           [abc]*                      |  Any file beginning with either a. b, or c                                     |
#  |           [[:upper:]]*                |  Any file beginning with an uppercase letter                                   |
#  |           [![:digit:]]*               |  Any file not beginning with a numeral                                         |
#  |           *[[:lower:]123]             |  Any file ending with a lowercase letter or the numerals 1,2,0r 3              |
#  |           BACKUP.[0-9][0-9][0-9]      |  Any file beginning with BACKUP, followed by exactly three numerals.           |
#  |---------------------------------------|--------------------------------------------------------------------------------|

# REDIRECTION
#  I/O redirection allows us to redefine where standard output goes.
#  To redirect standard output(stdout) to another file instead of the screen, 
#  we use the > redirection operator followed by the name of the file.

# We could tell the shell to send the output of the ls command to the file ls-output.txt instead of the screen
ls -l /usr/bin > ls-output.txt


# grep -- Print Lines Matching a Pattern
# grep is a powerful program used to find text patterns within files, like this:
#                       grep pattern [file....]
# when grep encounters a "pattern" in the file, it prints out the lines containing it


# COMMANDS

mkdir itb_globe                            # make directory named itb_globe
cd itb_globe                               # move to itb_globe directory
touch file1 file2 file3                    # make three empty files
ls *                                       # list all files
echo *                                     # shows all files
echo ls *                                  # shows ls and all files
echo ls '*'                                # shows ls and * (single quote)
echo '$HOME'                               # shows $HOME
echo "$HOME"                               # shows your home directory path
ls "*"
ls *1                                      # list all files that ends with 1
ls file[12]                                # list all files that ends with 1, 2
ls file[a-z]                               # list all files that neds with a-z
ls file[a-z][0-9]                          # list all files that ends with [a-z][0-9]
echo file?                                 # shows all files that ends with any single characters
touch .adotfile
mkdir .adotfolder
touch .adotfolder/file1 .adotfolder/.adotfile
ls
ls *
echo .*                                    # shows all dot files
cd .                                       # remain in the same directory
echo text > afile                          # redirect text to afile
grep text afile                            # matching a pattern text in file afile and prints tot he console
grep '*' afile
grep '.*' afile
