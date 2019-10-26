# BASH Scripting Fundamentals


## Why Scripting in Bash Makes Sense
 
   + **/bin/sh** is the default shell since the very first days of UNIX
   
        + Many alternative shells have been developed and are still available and used
        +  **/bin/bash** is the most common shell on Linux and other Unices
        
   + Large parts of the operating system and its applications are written in bash
        
       + Look for instance in **/etc/init.d**, **/etc/profile** and many more
       
 ## What Exactly Is a Script?
    
   + A script is a simple program that doesn't have to be compiled
   + A script can be mere list of commands that are executed sequentially
   + Or more cleaver things can be accomplished, using smart elements like:
           
       + variables
       + conditional structures           
       + user input processing
       
  ## Editor
    
   + Any text editor will do
   + **vim** is a popular editor on Linux
   + Once **vim** knows which contents is in a file, syntax highlighting is used
         
      + Tip! Start your script with the line **#!/bin/bash**, close the document, and open it again
           to get syntax highlighting
    
 ## Core Bash Script Ingredients
     
  + The "shebang"; #!/bin/bash
     + **#** is NOT a comment sign in this case
  + Comment lines explaining what the script wants to accomplish
  + White lines and other structural componets that make the script readable
  + An **exit** (try echo $?) statement if you don't want to use the exit status of the last command in the script
  
  > Try : [hello.sh](https://github.com/OddExtension5/Linux-Guide/blob/master/bash%20shell/code/hello.sh)
  
  
 ## Storing and Running the Script
  
  + On Linux the current directory is not in the **$PATH** variable
  + Consider storing the script in a directory that is in **$PATH**, such as /usr/local/bin or $USER/bin
  + Or run the script using **./myscript**
  + Notice that running a script without **./** in fornt may lead to unexpected results
  
 ## Making Your Script Executable
   
   + In order to run the script, it must have the Execute permission applied
     + **chmod + x myscript**
   + If the script is started as an argument to the bash shell, it doesn't need the execute permission itself
     + **bash myscript**
     
 ## Understanding bash Internal and External Commands
    
   + An ***internal command*** is a part of the Bash shell
      + It does not have to be loaded from disk and therefore is faster
      + Use **help** to get a list of all internal commands
   + An ***external commands*** is a command that is loaded from an executable file on disk
   + External commands normally are slower
