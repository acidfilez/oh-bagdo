
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

bagdo-utils-find-pid-by_port () { #Find PID number from port #

    echo -e "\033[38;5;148m Find PID number from a port \033[39m"

    echo -e "\033[38;5;148m 1 arg = $1  is the port number   \033[39m "

    echo "PID for Port: $1 is: $(lsof -t -i tcp:$1)"
}


bagdo-utils-find-listen-port () { #Find open ports #

    echo -e "\033[38;5;148m Finde open ports \033[39m"


    echo 'lsof -i -P | grep -i "listen"'

    lsof -i -P | grep -i "listen"
}


bagdo-utils-kill-port () { #Kill PID by port #

    echo -e "\033[38;5;148m Kill PID by port 033[39m"

    echo -e "\033[38;5;148m 1 arg = $1 is the port number   \033[39m "

    echo "kill -9 $(lsof -t -i tcp:$1)"

    kill -9 $(lsof -t -i tcp:$1)
}


bagdo-utils-find-port-name () { #Find Port number from name #

    echo -e "\033[38;5;148m Find Port number from name \033[39m"

    echo -e "\033[38;5;148m 1 arg = $1  is the name of the app   \033[39m "

    echo -e "\033[38;5;148m lsof -i -P | grep -i 'listen' | grep $1 | awk '{print dolar(9)}'   \033[39m "

    echo -e "\033[38;5;148m This make take a while   \033[39m "

    lsof -i -P | grep -i "listen" | grep $1 | awk '{print $9}'
}
