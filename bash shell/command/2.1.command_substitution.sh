# Command Substitution:
#    It allows us to use the ouput of a command as an expansion

echo $(ls)
ls -l $(which cp)



# Quoting
#    Learn how we can control the shell expansion

echo this is a         test
echo The total is $100.0

# The shell provides a mechanism called quoting to selectively supress unwanted expansions.




## Double Quotes
#     If you place text inside double quotes all the special characters used by the shell lose their special meaning and are treated as ordinary characters.
#     The exceptions are $(dollar sign), \(backslash), and `(back tick).
#     This means that word splitting, pathname expansion, tilde expansion and brace expansion are supressed,
#     but parameter expansion, arithmetic expansion are still carried out.

echo this is a       test
echo $(cal)
echo "$(cal)"
echo "$(USER) $((2+2)) $(cal)"



## Single Quotes
#      If we need to supress all expansions, we use single quotes

echo text ~/*.txt {a,b} $(echo foo) $((2+2)) $USER
echo "text ~/*.txt {a,b} $(echo foo) $((2+2)) $USER"
echo 'text ~/*.txt {a,b} $(echo foo) $((2+2)) $USER'



## Escaping Characters
#        Sometimes we want to quote only a single character. To do this, we can precede a character with a backslash,
#        which in this context is called escape character.

USER=sushil
echo "The balance for user $USER is: \$5.00"



# COMMAND

hostname                                    # show or set the system hostname
echo "My hostname is: $(hostname)"          # not supress $()
echo 'My hostname is: $(hostname)'          # supress $()
echo "My hostname is: `hostname`"           # not supress ``
echo 'My hostname is: `hostname`'           # supress ''
mkdir itb_cmdsub
cd itb_cmdsub
ls $(echo a $(echo b))
cd ..
ls `echo a `echo b``
ls `echo a \`echo b\``
echo `echo \` \\\`echo inside\\\`\``
echo $(echo $(echo $(echo inside)))
