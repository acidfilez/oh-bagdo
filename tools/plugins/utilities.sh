
#use full shortcuts


#goodies
alias "cls"="clear"
alias "ls"="ls -lG"
alias "la"="ls -la"

#find sizes
alias "ducks"="du -cks * | sort -rn | head"

#tails the last file
alias "tail-last"="tail -f $(ls -1t | head -1)"

alias bsr='browser-sync start --proxy http://bagdo.modyo.me:3000 --browser "Google Chrome" --files "app/assets/stylesheets/**/*.scss, app/assets/javascripts/**/*.js, app/views/**/*.html.erb"'