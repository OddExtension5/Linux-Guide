MYVAR=value                                     # a variable MYVAR 
echo $MYVAR                                     # print value of variable
MYSTRING="A string"                             # a variable whose value is string of characters ( use double quote )
echo $MYSTRING                                  # print value of MYSTRING variable
MYSTRING="A string with $MYVAR in it"
echo $MYSTRING                                  # it will print ( A string with value in it ) when double quote is used
MYSTRING='A string with $MYVAR in it'  
echo $MYSTRING                                  # it will print ( A string with $MYVAR in it) when single quote is used
echo $PPID                                      # it shows process id ( readonly variable ) 
PPID=anyvalue                                   # it shows PPID: readonly variable
echo $PPID
readonly READONLYVAR=value                      # READONLYVAR is variable which is readonly type
READONLYVAR=anyvalue                            # cannot change value since READONLYVAR is readonly variable
MYVAR=value
bash                                            # start new bash shell ( child of previous bash (parent shell) )
echo $MYVAR                                     # therefore value is not available in child shell so shows blank
exit                                            # exit from the bash shell
echo $MYVAR                                     # now we're in parent bash shell where variable is defined so it shows up the given value
unset MYVAR                                     # unset the value of MYVAR
echo $MYVAR                                     # it shows blank because it is unset
export MYVAR=anothervalue                       # for using variable in child bash shell use export before it
bash        
echo $MYVAR                                     # it shows MYVAR value
exit
env                                             # list the environment variable
declare                                         # set variable values and attributes
declare -f                                      # just functions 
declare -F                                      # just function headers
declare -r                                      # readonlys
declare -i                                      # just integers
declare -v
bash --version                                  # shows bash shell version
declare -a                                      # just arrays
echo $BASH_VERSINFO                             # shows just version of bash shell
echo $BASH_VERSINFO[0]                          # it shows 4[0]
echo ${BASH_VERSINFO[0]}                        # it shows 4, which is the value of array at position 0
echo $BASH_VERSION_and_some_string              # blank
echo ${BASH_VERSION}_and_some_string            # it shows 4_and_some_string
echo ${BASH_VERSINFO}                           # 4
unset A 
echo $A                                         # blank
A=1
echo $A                                         # 1
echo ${A[0]}                                    # 1 , In bash everything is an Array
echo ${A[1]}                                    # blank, since at position A[1] value is not provided
echo ${BASH_VERSINFO[0]}
echo ${BASH_VERSINFO[1]}
echo ${BASH_VERSINFO[2]}
echo ${BASH_VERSINFO[3]}
echo ${BASH_VERSINFO[4]} 
echo ${BASH_VERSINFO[5]}
echo ${BASH_VERSINFO[6]}
