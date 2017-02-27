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

    CONTAINER_ID=$(docker ps -f 'name=$1' -q)

    echo -e "\033[38;5;148m docker exec -u 0 -it $CONTAINER_ID /bin/bash   \033[39m "

    docker exec -u 0 -it $CONTAINER_ID /bin/bash
}


bagdo-docker-login-default () { #log into the contaier as the default user #

    echo -e "\033[38;5;148m Docker Container As Default \033[39m"

    echo -e "\033[38;5;148m 1 arg = $1  is the container name (not id)   \033[39m "

    CONTAINER_ID=$(docker ps -f 'name=$1' -q)

    echo -e "\033[38;5;148m docker exec -it $CONTAINER_ID /bin/bash   \033[39m "

    docker exec -it $CONTAINER_ID /bin/bash
}

bagdo-docker-login-user () { #log into the contaier as a user #

    echo -e "\033[38;5;148m Docker Container As Default \033[39m"

    echo -e "\033[38;5;148m 1 arg = $1  is the container name (not id)   \033[39m "
    echo -e "\033[38;5;148m 2 arg = $2  is the user name \033[39m "

    CONTAINER_ID=$(docker ps -f 'name=$1' -q)

    echo -e "\033[38;5;148m docker exec -u $2 -it $CONTAINER_ID /bin/bash   \033[39m "

    docker exec -u $2 -it $CONTAINER_ID /bin/bash
}

bagdo-docker-run-terminal-user () { #run a container using an image with a default user. #

    echo -e "\033[38;5;148m Docker Run  \033[39m"

    echo -e "\033[38;5;148m 1 arg = $1  is the container name (not id)   \033[39m "
    echo -e "\033[38;5;148m 2 arg = $2  image name \033[39m "
    echo -e "\033[38;5;148m 3 arg = $3  user to use\033[39m "

    echo -e "\033[38;5;148m docker run -u $3 -ti --name $1 $2    \033[39m "

    docker run -u $3 -ti --name $1 $2 /bin/bash
}


bagdo-docker-commit () { #commits the container #

    echo -e "\033[38;5;148m Docker Run  \033[39m"

    echo -e "\033[38;5;148m 1 arg = $1  is the container name (not id)   \033[39m "
    echo -e "\033[38;5;148m 2 arg = $2  commit name \033[39m "

    echo -e "\033[38;5;148m docker commit $1 $2  \033[39m "

    docker commit $1 $2
}

bagdo-docker-push () { #push a docker image to hub. #

    echo -e "\033[38;5;148m Docker Push, but first run a bagdo-docker-commit of the container then push  \033[39m"

    echo -e "\033[38;5;148m 1 arg = $1  is the image name to push (example: modyodx/ubuntu:1.0.1 \033[39m "

    echo -e "\033[38;5;148m docker push $1 \033[39m "

    docker push $1
}
