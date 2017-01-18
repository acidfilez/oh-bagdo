bagdo-docker-container () { #docker containers that are active #

    echo -e "\033[38;5;148m Active Docker Container \033[39m"

    echo "docker ps"

    docker ps
}

bagdo-docker-containers () { #all docker containers#

    echo -e "\033[38;5;148m Active Docker Container \033[39m"

    echo "docker ps -a"

    docker ps -a
}

bagdo-docker-images () { #docker containers #

    echo -e "\033[38;5;148m Docker Container \033[39m"

    echo "docker images"

    docker images
}

bagdo-docker-login-root () { #log into the container as root user #

    echo -e "\033[38;5;148m Docker Container As Root \033[39m"

    echo -e "\033[38;5;148m 1 arg = $1  is the container name (not id)   \033[39m "

    echo -e "\033[38;5;148m docker exec -u 0 -it $(docker ps -f 'name=$1' -q) /bin/bash   \033[39m "

    docker exec -u 0 -it $(docker ps -f "name=$1" -q) /bin/bash
}


bagdo-docker-login-default () { #log into the contaier as the default user #

    echo -e "\033[38;5;148m Docker Container As Default \033[39m"

    echo -e "\033[38;5;148m 1 arg = $1  is the container name (not id)   \033[39m "

    echo -e "\033[38;5;148m docker exec -it $(docker ps -f 'name=$1' -q) /bin/bash   \033[39m "

    docker exec -it $(docker ps -f "name=$1" -q) /bin/bash
}

bagdo-docker-login-user () { #log into the contaier as a user #

    echo -e "\033[38;5;148m Docker Container As Default \033[39m"

    echo -e "\033[38;5;148m 1 arg = $1  is the container name (not id)   \033[39m "
    echo -e "\033[38;5;148m 2 arg = $2  is the user name \033[39m "

    echo -e "\033[38;5;148m docker exec -u $2 -it $(docker ps -f 'name=$1' -q) /bin/bash   \033[39m "

    docker exec -u $2 -it $(docker ps -f "name=$1" -q) /bin/bash
}