# PROBLEMS on BASH Scripting

+ Create a script that copies the contents of the log file **/var/log/messages** to **/var/log/messages.old** and deletes the contents of the **/var/log/messages** file.

  For Solution : [click here](https://github.com/OddExtension5/Linux-Guide/blob/master/bash_shell/q%26a/solution/clearlogs.sh)
   
+ Write a script with the name **totmp**. This script should copy all files of which 
 the names are provided as arguments on the command line to the users home directory.
 If no files have been provided, the script should **read** to ask for file names, and 
 copy all file names provided in the answer to the users home directory.

  For Solution : [click here](https://github.com/OddExtension5/Linux-Guide/blob/master/bash_shell/q%26a/solution/totmp.sh)
  
 + Write a script that puts the result of the command **date +%d-%m-%y** in a variable. Use Pattern Matching on this variable to show 3 lines, displaying the date, month and year. So the result should looks as follows:
 
         The day is 05 <br>
         The month is 01 <br>
         The year is 15 <br>

      For Solution : [click here](https://github.com/OddExtension5/Linux-Guide/blob/master/bash_shell/q%26a/solution/pattern_matching.sh) 
 
 + Create a script that transforms the string cn=lara, dc=example, dc=com in a way that user name (lara) is extracted from the string. Also make sure that the result is written in all lowercase. Store the username in the variable USER and at the end of the script, echo the value of this variable.
 
      For Solution : [click here](https://github.com/OddExtension5/Linux-Guide/blob/master/bash_shell/q%26a/solution/transform_string.sh)
