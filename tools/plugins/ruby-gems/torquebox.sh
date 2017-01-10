#Bagdo alias for torquebox

bagdo-ruby-gem-torquebox-kill () { #Kills the torquebox then jboss#

    echo -e "\033[38;5;148m Kills the tortquebox then jboss \033[39m"

    ps aux | grep -ie "[t]orquebox" | awk '{print $2}' | xargs kill -9
    ps aux | grep -E "[t]orquebox.*jboss/bin/standalone.sh" | awk '{print $2}' | xargs kill -9
}
