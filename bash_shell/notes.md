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
   
    
## Using Here Documents
  
  + In a here document, I/O redirection is used to feed a command list into an interactive program or command, such as for instance **ftp** or **cat**
  + Use it in scripts to replace echo for long texts that need to be displayed
  + Use it if in a script a command is called that opens its own prompt, such as an FTP client interface
  
> Try: [heredoc1.sh](https://github.com/OddExtension5/Linux-Guide/blob/master/bash%20shell/code/heredoc1.sh)

## Understanding Substitution Operators
   
   + A substitution operator (also known as string operator) allows you to manipulate values of variables in an easy way
        + Ensure that variable exist
        + Set default values for variables
        + Catch errors that result from variables that don't exist
        + Remove portions of variable values
        
## Substitution Operator Examples
   
   + **${VAR:-word}** : If $VAR exists, use its value, if not, return the value "word". This does NOT set the variable.
   + **${VAR:=word}** : If $VAR exists, use its value, if not, set the default value to "word"
   + **${VAR:?message}** : If $VAR exists, show its value. If not, display VAR followed by message. If message is omitted, the message VAR: parameter null or not set will be shown.
   + **${VAR:offset:length}** : If $VAR exists, show the substring of $VAR, starting at offset with a legth of length
   
   For Examples : [click here](https://github.com/OddExtension5/Linux-Guide/blob/master/bash_shell/code/susbtitution_operator.sh)
   
## Why Use Pattern Matching Operators?
    
   + Pattern Matching is used to remove patterns from a variable
   + It's an excellent way to clean up variables that have too much information
       + For example, if $DATE contains 05-01-15 and you just need today's year
       + Or if a file has the extension *.doc and you wnat to rename it to use the extension *.txt
    
 ## Pattern Matching Explained
   
   + **${VAR#pattern}** : Search for pattern from the beginning of variable's value, delete the shortest part that matches, and return the rest
       + FILENAME=/usr/bin/blah <br>
         echo ${FILENAME#*/}   <br>
         usr/bin/blah  
         
   + **${VAR##pattern}** : Search for pattern from the beginning of variable's value, delete the longest part that matches, and return the rest
       + FILENAME=/usr/bin/blah <br>
         echo ${FILENAME##*/} <br>
         blah
         
   + **${VAR%pattern}** : If pattern matches the end of the variable's value, delete the shortest part that matches, and return the rest
       + FILENAME=/usr/bin/blah <br>
         echo ${FILENAME%/*}    <br>
         /usr/bin        
         
   + **${VAR%%pattern}** : If pattern matches the end of the variable's value, delete the longest part that matches, and return the rest
       + FILENAME=/usr/bin/blah <br>
         echo ${FILENAME%%/*} <br>
         **empty**
         
   Example Script : [click here](https://github.com/OddExtension5/Linux-Guide/blob/master/bash_shell/code/pattern_matching.sh)
    
    
## Understanding Regular Expressions
   
  + Regular expressions are search patterns that can be used by some utitlities (**grep** and other text processing utilities, **awk**, **sed**)
  + Regular expressions are NOT the same as shell wildcards
  + When using regular expressions, put them between strong quotes so that the shell won't interpret them
  
## Regular Expressions Overview
   
  |    Regular Expression                |                         Use                                                               |
  |--------------------------------------|-------------------------------------------------------------------------------------------|
  |       ^text                          |   Line starts with text                                                                   |
  |       text$                          |   Line ends with text                                                                     |
  |         .                            |   Wildcard (Matches any single character)                                                 |
  |     [abc], [a-c]                     |   Matches a,b or c                                                                        |
  |         *                            |   Matches 0 to an infinite number of the previous character                               |
  |        \{2\}                         |   Matches exactly 2 of the previous character                                             |
  |       \{1,3\}                        |   Match a minimum of 1 and a maximaum of 3 of the previous character                      |
  |       colou?r                        |   Match 0 or 1 of the previous character (which makes the previous character optional)     |

## Bash Calculating
   
   + Bash offers different ways to calculate in a script
   + Internal calculation: **$(( 1 + 1 ))**
   + External calculation with **let**:
       
       #!/bin/bash <br>
       #$1 is the first number <br>
       #$2 is the operator  <br>
       #$3 is the second number <br>
       let x="$1 $2 $3" <br>
       echo $x
   + External calculation with **bc**
   
## Using bc
   
   + **bc** is developed as a calculator with its iwn shell interface
   + It can deal with more than just integers
   + Use **bc** is non-intercative mode:
       + echo "scale=9; 10/3"| bc
   + Or in a variable:
       + VAR=$(echo "scale=9; 10/3" | bc)
       
## Using grep

   + **grep** is a very flexible tool to search for text patterns based on regular expressions
   
        + **grep -i**: case insensitive
            + **grep -i what * **
        + **grep -v**: exclude lines that match the pattern
            + **grep -v what * **
        + **grep -r**: recursive
            + **grep -r what * **
        + **grep -e (egrep)**: matches more regular expressions
            + **grep -e 'what' -e 'else' *
        + **grep -A5**: shows 5 lines after the matching regex
        + **grep -B4**: shows 4 lines before the matching regex
        
 ## Using test
     
   + **test** allows for testing of many items
       + expression: **test (ls /etc/hosts )**
       + string: **test -z $1**
       + integers: **test $1 = 6**
       + file comparisons: **test file1 -nt file2**
       + file properties: **test -x file1**
       
       
 ## Three Ways to test
    
   + **test -z $1**: old method, using an internal bash command
   + **[ -z $1 ]**: equivalent to test, using bash internal
   + **[[ -z $1 ]]**: new improved version of [...]. Not as universal as [...]; it has && and || built in
   + Best practice: If it doesn't work using [...], try using [[...]]
   + If compatibility with older shells doesn't matter, use [[...]]
   + Compare the following:
       + **[ $BLAH = a* ]] || echo string does not start with a**
       + **[[ $BLAH = a* ]] || echo string does not start with a**

## Using cut and sort
   
   
   + **cut** is used to filter a specific column or field out of a line
   + **sort** is used to sort data in a specific order
   + **cut** and **sort** are often seen together
   
## cut and sort Examples
   
   + **cut -f 1 -d : /etc/passwd**
   + **sort /etc/passwd**
   + **cut -f 2 -d : /etc/passwd | sort -n**
   + **du -h | sort -rn**
   + **sort -n -k2 -t : /etc/passwd**
   
## Using tail and head
   
   + **tail** is used to display the last line(s) of a file
   + **head** is used to display the first line(s) of a file
   + **tail -2 /etc/passwd**
   + **head -2 /etc/passwd**
   + **head -5 /etc/passwd | tail -1**
   
## Using sed
    
   + **sed** is more than a text processing utility, it's programming language with many features
   + A limited set of these are useful in scripts
   + **sed -n 5p /etc/passwd**
   + **sed -i s/old-text/new-text/g ~/myfile**
   + **sed -i -e '2d' ~/myfile**
   + **sed -i -e '2d;20,25d' ~/myfile**
   
## Using awk
   
   + Like **sed**, **awk** is a very rich language
   + In scripts you'll appreciate it as an alternative to **cut** to filter information from text files based on regular expression-based patterns
   + The basic usage is **awk '/search pattern/ {Actions}' file**
   + **awk -F : '{ print $4 }' /etc/passwd**
   + **awk -F : '/user/ { print $4 }' /etc/passwd**
   + **awk -F : '{ print $1,$NF }' /etc/passwd** ($NF is the last field)
   + **awk -F : '$3 > 500' /etc/passwd**
   + **awk -F : '$NF ~/bash/' /etc/passwd**
   
## Using tr
    
   + **tr** helps in transofrming strings
   + **echo hello | tr [a-z] [A-Z]**
   + **echo hello | tr [:lower:] [:upper:]**
   
   
