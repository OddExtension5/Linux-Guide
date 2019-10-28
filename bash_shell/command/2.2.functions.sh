# Bash Function
#    Functions in Bash Scripting are a great way to reuse code.

# Functions: Written in two different formats

   function_name () {                                        function function_name {                                
        # commands                                                 #commands
        ls                                                         ls
    }                                                         }
    
    
#--------------------------------------------------------------------------------------------------------------------------------   
print_something () {
    echo Hello I am a function
}

print_something
#--------------------------------------------------------------------------------------------------------------------------------
print_something () {
    echo Hello $1
}

print_something World
#--------------------------------------------------------------------------------------------------------------------------------
print_something () {
    echo Hello $1
    return 5
}

print_something World
echo The previous function ha a return value of $?
#--------------------------------------------------------------------------------------------------------------------------------
line_in_file () {
    cat $1 | wc -l
 }
 
 num_lines=$( lines_in_file $1)
 
 echo The file $1 has $num_lines lines in it.
 #-------------------------------------------------------------------------------------------------------------------------------
 
 
# Variable Scope
#   Scope refers to which parts of a script can see which variables. By default a variable is global.
#   This means that it is visible everywhere in the script.
#   We may also create a variable as a local variable
#   when we create a local variable within a function, it is only visible within that function.
 
# Syntax:  local var_name=var_value

#--------------------------------------------------------------------------------------------------------------------------------
var_change () {
    local var1='local 1'
    echo Inside function: var1 is $var1 : var2 is $var2
    var1='changes again'
    var2='2 changed again'
}

var1='global 1'
var2='global 2'

echo Before function call: var1 is $var1 : var2 is $var2

var_change

echo After function call: var1 is $var1 : var2 is $var2

#---------------------------------------------------------------------------------------------------------------------------------

# Overriding Commands
#   It is possible to name a function as the same name as a command you would normally use on the command line

#----------------------------------------------------------------------------------------------------------------------------------
ls () {
    command ls -lh
}

ls
#----------------------------------------------------------------------------------------------------------------------------------

# *put the keyword command in fornt of the name when we want the command as opposed to the function as thhe function normally
# takes precedence



# Examples:

#-----------------------------------------------------------------------------------------------------------------------------------
function myfunc {
        echo Hello World
}
myfunc
#-----------------------------------------------------------------------------------------------------------------------------------
function myfunc {
        echo $1
        echo $2
}
myfunc "hello World"
myfunc Hello World
#-----------------------------------------------------------------------------------------------------------------------------------
function myfunc {
        echo $myvar
}
myfunc
myvar="Hi from outside the function"
myfunc
#------------------------------------------------------------------------------------------------------------------------------------
function myfunc {
        local myvar="Hi from inside the function"
        echo $myvar
}
myfunc
echo $myvar
local myvar="Will this work?"
#------------------------------------------------------------------------------------------------------------------------------------

builtin ls
builtin cd /tmp
builtin cd -
type cd
type ls

#------------------------------------------------------------------------------------------------------------------------------------
function cd() {
        echo 'No!'
}

cd /tmp
bultin cd /tmp
type cd
cd -
unset -f cd
cd /tmp
type cd
cd -
#-------------------------------------------------------------------------------------------------------------------------------------
declare -f
declare -F

type builtin
help builtin
builtin grep
builtin notaprogram
which grep
which cd
which builtin
which doesnotexist
type which
alias cd=doesnotexist
alias
cd
unalias cd
cd /tmp
cd -
alias
