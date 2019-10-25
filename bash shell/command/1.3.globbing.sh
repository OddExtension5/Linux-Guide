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



mkdir itb_globe
cd itb_globe
touch file1 file2 file3
ls *
echo *
echo ls *
echo ls '*'
echo '$HOME'
echo "$HOME"
ls "*"
ls *1
ls file[12]
ls file[a-z]
ls file[a-z][0-9]
echo file?
touch .adotfile
mkdir .adotfolder
touch .adotfolder/file1 .adotfolder/.adotfile
ls
ls *
echo .*
cd .
echo text > afile
grep text afile
grep '*' afile
grep '.*' afile
