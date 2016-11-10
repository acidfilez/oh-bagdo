
#use full shortcuts


#goodies
alias "cls"="clear"
alias "ls"="ls -lG"
alias "la"="ls -la"

#find sizes
alias "ducks"="du -cks * | sort -rn | head"

#tails the last file
alias "tail-last"="tail -f $(ls -1t | head -1)"
