#!/bin/bash

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

bagdo-utils-find-pid-by_port () { #Finds the PID number from desired port #

    echo -e "\033[38;5;148m Find PID number from a port \033[39m"

    echo -e "\033[38;5;148m 1 arg = $1  is the port number   \033[39m"

    echo "PID for Port: $1 is: $(lsof -t -i tcp:$1)"
}


bagdo-utils-find-listen-port () { #Find open ports that are listening #

    echo -e "\033[38;5;148m Find open ports that are listening \033[39m"

    echo 'lsof -i -P | grep -i "listen"'

    lsof -i -P | grep -i "listen"
}


bagdo-utils-kill-port () { #Kill PID by port #

    echo -e "\033[38;5;148m Kill PID by port 033[39m"

    echo -e "\033[38;5;148m 1 arg = $1 is the port number   \033[39m"

    echo "kill -9 $(lsof -t -i tcp:$1)"

    kill -9 $(lsof -t -i tcp:$1)
}


bagdo-utils-find-port-name () { #Find Port number from name #

    echo -e "\033[38;5;148m Find Port number from name \033[39m"

    echo -e "\033[38;5;148m 1 arg = $1  is the name of the app   \033[39m"

    echo -e "\033[38;5;148m lsof -i -P | grep -i 'listen' | grep $1 | awk '{print dolar(9)}'   \033[39m"

    echo -e "\033[38;5;148m This make take a while   \033[39m"

    lsof -i -P | grep -i "listen" | grep $1 | awk '{print $9}'
}

bagdo-utils-tar-gz () { #Compress folder (tar and gz)#

    echo -e "\033[38;5;148m Compres Folder \033[39m"

    echo -e "\033[38;5;148m 1 arg = $1  is the name of your name.tar.gz   \033[39m"

    echo -e "\033[38;5;148m 2 arg = $2  folder path   \033[39m"

    echo -e "\033[38;5;148m tar -zcvf $1.tar.gz $2   \033[39m"

    echo -e "\033[38;5;148m This make take a while   \033[39m"

    tar -zcvf $1.tar.gz $2
}


bagdo-utils-un-tar-gz () { #Un Compress folder a tar.gz file#

    echo -e "\033[38;5;148m Compres Folder \033[39m"

    echo -e "\033[38;5;148m 1 arg = $1  is the name of your name.tar.gz   \033[39m"

    echo -e "\033[38;5;148m tar -xvzf $1   \033[39m"

    echo -e "\033[38;5;148m This make take a while   \033[39m"

    tar -xvzf $1
}


bagdo-utils-find-ip4-interface () { #Find the ipv4 on interface en0, eth0, lo0, bridge0, awdl0, utun0#

    echo -e "\033[38;5;148m Find the ipv4 on interface en0, eth0, lo0, bridge0, awdl0, utun0 \033[39m"

    echo -e "\033[38;5;148m 1 arg = $1  is the name interface example: en0   \033[39m"

    ifconfig $1 | grep "inet .*" | awk '{print $1 " " $2}'
}


bagdo-utils-find-ip6-interface () { #Find the ipv6 on interface en0, eth0, lo0, bridge0, awdl0, utun0#

    echo -e "\033[38;5;148m Find the ipv6 on interface en0, eth0, lo0, bridge0, awdl0, utun0 \033[39m"

    echo -e "\033[38;5;148m 1 arg = $1  is the name interface example: en0   \033[39m"

    ifconfig $1 | grep "inet6.*" | awk '{print $1 " " $2}'
}

bagdo-utils-copy-dir () { #Clones a directory#

    echo -e "\033[38;5;148m Find the ipv6 on interface en0, eth0, lo0, bridge0, awdl0, utun0 \033[39m"

    echo -e "\033[38;5;148m 1 arg = $1  is directory you want to clone   \033[39m"
    echo -e "\033[38;5;148m 2 arg = $2  new directory path  \033[39m"

    echo -e "\033[38;5;148m cp -av $1 $2   \033[39m"

    cp -av $1 $2
}

bagdo-utils-find-file-with-text () { #Finds the files with a specific text recursively#

    echo -e "\033[38;5;148m Finds the files with a specific text recursively \033[39m"

    echo -e "\033[38;5;148m 1 arg = $1  inital path   \033[39m"
    echo -e "\033[38;5;148m 2 arg = $2  text to find  \033[39m"

    echo -e "\033[38;5;148m grep -rni $1 -e '$2'   \033[39m"

    grep -rni $1 -e $2
}



bagdo-utils-lock-account () { #Suspend Account#

    echo -e "\033[38;5;148m Suspens your account to your lock screen \033[39m"

    /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
}

