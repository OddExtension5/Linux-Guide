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


## Understanding Command Line Parsing

  + When a command is interpreted by the shell, the shell interprets all special characters
      + This process is known as ***command line parsing***
  + Commands themselves may interpret parts of the command line as well
  + To ensure that a special character is interpreted by the command and not by the shell, use quoting
  
## Quoting
  
  + Quoting is used to treat special characters literally
  + If a string of characters is surrounded with single quotation marks, all characters are stripped of the special meaning they may have
     + Imagine **echo 2*3 > 5**, whic would be interpreted
     + Or imagine **find .-name '*.doc'** which ensures that **find** interprets *.doc and not the shell
  + Double quotes are weak quotes and treat only some special characters as special
  + A backslash can be used to escape the one following character
  
## Using Double Quotes

  + Double quotes ignore pipe characters, aliases, tilde substitution, wildcard expression, and splitting into words using delimiters
  + Double quotes do allow parameter substitution, command substitution, and arithmetic expression evaluation
  + best practice: use single quotes, unless you specifically need parameter, command, or arithmetic substitution
  
## Handling Script Arguments
   
   + Any argument that was used when starting a script, can be dealt with from within the script
   + Use $1, $2 and so on to refer to the first, the second, etc. argument
   + **$0** refers to the name of the script itself
   + Use **${nn}** or **shift** to refer to arguments beyond 9
   + Arguments that are stored in $1 etc. are read only and cannot be changed from within the script
   
> Try : [simplearg](https://github.com/OddExtension5/Linux-Guide/blob/master/bash%20shell/code/simplearg.sh)

Run Commands : 

  + chmod + simplearg.sh
  + ./simplearg sushil sneha
  + ./simplearg sushil sneha debagni
  + ./simplearg sushil sneha debagni aakansha
   
## Handling Argumets the Smart Way
   
   + The previous example works only if the amount of argumets is known on berforehand
   + If this is not the case, use **for** to evaluate all possible arguments
   + Use **$@** to refer to all arguments provided, where all arguments can be treated one by one
   + Use **$#** to count the amount of argumets provided
   + Use **$*** if you need a single string that contains all arguments (use in specific cases only)
   
> Try : [nicearg](https://github.com/OddExtension5/Linux-Guide/blob/master/bash%20shell/code/nicearg.sh)

Run commands:
    
   + chmod +x nicearg
   + ./nicearg a b c
   
Output:
    
  + $* gives a b c
  + $# gives 3
  + $@ gives a b c
  + $0 is path/nicearg
  + a b c
  + a
  + b
  + c
  
Testing script: **bash -x filename**

## Using Shift
  
  + Shift removes the first argument from a list so that the second argument gets stored in $1
  + Shift is useful in older shell versions that do not understand ${10} etc.
  
> Try: [shift_arg.sh](https://github.com/OddExtension5/Linux-Guide/blob/master/bash%20shell/code/shift_arg.sh) <br>
> Try: [shift_arg2.sh](https://github.com/OddExtension5/Linux-Guide/blob/master/bash%20shell/code/shift_arg2.sh)

## Understanding Command Substitution

  + Command susbtitution allows using the result of a command in a script
  + Useful to provide ultimate flexibility
  + Two allowd syntaxes:
     + **`command`** (deprecated)
     + **$(command)** (preferred)
  + **ls -l $(which passwd)**
  
## Using String Verification
  
  + When working with arguments and input, it is useful to be able to verify availability and correct use of a string
  + Use **test -z** to check if a string is empty
    + **test -z $1 && exit 1**
  + Use **[[...]]** to check for specific patterns
    + **[[ $1=='[a-z]*' ]] || echo $1 does not start with a letter**
   
    
# Using Here Documents
  
  + In a here document, I/O redirection is used to feed a command list into an interactive program or command, such as for instance **ftp** or **cat**
  + Use it in scripts to replace echo for long texts that need to be displayed
  + Use it if in a script a command is called that opens its own prompt, such as an FTP client interface
  
> Try: [heredoc1.sh](https://github.com/OddExtension5/Linux-Guide/blob/master/bash%20shell/code/heredoc1.sh)
