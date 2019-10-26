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
   
   
 ## Finding Help About Scripting Components
 
   + **man bash** contains all help you need, but is very large
   + **help commands** can be used for information about Bash internals
      + **help export**
   + Many resources are avilable on the internet
      + The [Advanced Bash-Scripting Guide](http://tldp.org/guides.html) is authoritative, but large and not always easy to           understand

## Terminology
   
   + An ***argument*** is anything that can be used after a command
      + **ls -l /etc** has two arguments
   + An ***option*** is an argument that was specifically developed to change the command behaviour
   + A **parameter** is a name that is defined in a script to which a specific value is granted
   + A ***variable*** is a label that is stored in memory and contains a specific value
   
## Using and Defining Variables

   + Using variables makes a script flexible
   + They allow for dynamic scripts that can easily be modified to act on different values
   
  > Look: [clearlogs_var.sh](https://github.com/OddExtension5/Linux-Guide/blob/master/bash%20shell/code/clearlogs_var.sh)
  
## Defining Variables
   
   + There are three ways to define variables
      + Static: **VARNAME=value**
      + As an argument to a script, handled using **$1**, **$2** etc. within the script
      + Interactively, using **read**
   + Best practice: use uppercase only for variable names
   
## Notes About read
  
   + **read** will stop the script
   + If an argument is provided to **read**, this argument will be teated as a variable and the entered value is stored in the      variable
       + Multiple arguments can be provided to enter multiple variables
       + Use **read -a somename** to write all words to an array with the name somename
   + If no input is provided, the script will just pause until the user presses the Enter key
   
## Understanding Variables and Subshells
    
   + A variable is effectively only in the shell where it was defined
   + Use **export** to make it also available in subshells
   + There is no way to make variables available in parent shells
   
## Defining Variables at the Start of a Shell
   
   + **/etc/profile** is processed when opening a login shell
      + All variables defined here are available in all subshells for that specific user
      + User specific version can be used in **~/.bash_profile**
      
   + **/etc/bashrc** is processes when opening a subshell
      + Variables defined here are included in subshells from that point on
      + user specific versions can be used in **~/.bashrc**
   
## Using Sourcing
   
   + By using sourcing the contents of one script can be included in another script
   + This is a very common method to separate static script code from dynamic content
       + This dynamic content often consists of variables and functions
   + Use the **source** command or the **.** command to source scripts
   + Do not use **exit** at the end of a script that needs to be sourced
   
## Using Quotes for Escaping
  
  The bash shell uses different special characters
  
  
|  **Character**        |  **Meaning**                              |
|-----------------------|-------------------------------------------|
|       ~               |   Home directory                          |
|       `               |   Command SUbstitution                    |
|       #               |   Comment                                 |
|       $               |   Variable Expression                     |
|       &               |   Background job                          |
|       *               |   String wildcard                         |
|       (               |   Start subshell                          |
|       )               |   End subshell                            |
|       \               |   Quote next character                    |
|       |               |   Pipe                                    |
|       [               |   Start character set wildcard            |
|       ]               |   End character set wildcard              |
|       {               |   Start command block                     |
|       }               |   End command block                       |
|       ;               |   Shell command operator                  | 
|       '               |   Strong quote                            |
|       "               |   Weak quote                              |
|       <               |   Input redirect                          |
|       >               |   Output redirect                         |
|       /               |   Pathname directory separator            |
|       ?               |   Single character wildcard               |
