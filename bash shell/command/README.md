### What is a shell?
  
 A program takes input form a terminal
  
 Translates input into:
 
  + System Calls
  + Calls to other programs
  + Computation within the bash program
  
  Bash excels at 'gluing' other commands together
  
### What are the different shells?
   
   1. **The Bourne Shell (sh)**
   
     The Bourne shell (sh), written by Steve Bourne at AT&T Bell Labs, is the original UNIX shell. 
     It is the preferred shell for shell programming because of its compactness and speed.
     A Bourne shell drawback is that it lacks features for interactive use, such as the ability to recall previous commands (history). 
     The Bourne shell also lacks built-in arithmetic and logical expression handling.

     The Bourne shell is the Solaris OS default shell. It is the standard shell for Solaris system administration scripts. 
   
     For the Bourne shell the:
       + Command full-path name is /bin/sh and /sbin/sh.
       + Non-root user default prompt is $.
       + Root user default prompt is #.
   
   
   2. **The C Shell (csh)**

     Is a UNIX enhancement written by Bill Joy at the University of California at Berkeley.
     Incorporated features for interactive use, such as aliases and command history.
     Includes convenient programming features, such as built-in arithmetic and a C-like expression syntax.
     
     For the C shell the:
       + Command full-path name is /bin/csh.
       + Non-root user default prompt is hostname %.
       + Root user default prompt is hostname #.
       
   3. **The Korn Shell (ksh)**

     Was written by David Korn at AT&T Bell Labs
     Is a superset of the Bourne shell.
     Supports everything in the Bourne shell.
     Has interactive features comparable to those in the C shell.
     Includes convenient programming features like built-in arithmetic and C-like arrays, functions, and string-manipulation facilities.
     Is faster than the C shell.
     Runs scripts written for the Bourne shell.

     For the Korn shell the:
       + Command full-path name is /bin/ksh.
       + Non-root user default prompt is $.
       + Root user default prompt is #.
       
   4. **The GNU Bourne-Again Shell (bash)**

     Is compatible to the Bourne shell.
     Incorporates useful features from the Korn and C shells.
     Has arrow keys that are automatically mapped for command recall and editing.

     For the GNU Bourne-Again shell the:
       + Command full-path name is /bin/bash.
       + Default prompt for a non-root user is bash-x.xx$. (Where x.xx indicates the shell version number. For example, bash-3.50$)
       + Root user default prompt is bash-x.xx#. (Where x.xx indicates the shell version number. For example, bash-3.50$#)
       
   A short comparison of the all 4 shells and their properties:
   
       
       
   |         Shell	                     |           Path	              |   Default Prompt (non-root user) |	Default Prompt (Root user)|
   |-------------------------------------|------------------------------|----------------------------------|----------------------------|
   |    The Bourne Shell (sh)	           |     /bin/sh and /sbin/sh	    |        $                         |   	  #                     |
   |    The C Shell (csh)	               |     /bin/csh	                |        %	                       |      #                     |
   |    The Korn Shell (ksh)	           |     /bin/ksh	                |        $	                       |      #                     |
   |    The GNU Bourne-Again Shell (Bash)|     /bin/bash	              |        bash-x.xx$	               |     bash-x.xx#             |
   --------------------------------------------------------------------------------------------------------------------------------------
