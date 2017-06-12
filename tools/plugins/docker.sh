#!/bin/bash

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

# bagdo-docker-login-root () { #log into the container as root user #

#     echo -e "\033[38;5;148m Docker Container As Root \033[39m"

#     echo -e "\033[38;5;148m 1 arg = $1  is the container name (not id)   \033[39m "

#     CONTAINER_ID=$(docker ps -f 'name=$1' -q)

#     echo -e "\033[38;5;148m docker exec -u 0 -it $CONTAINER_ID /bin/bash   \033[39m "

#     docker exec -u 0 -it $CONTAINER_ID /bin/bash
# }


bagdo-docker-login () { #log into the contaier as the default user usualy root :) #

    echo -e "\033[38;5;148m Login Docker Container as default user usualy root \033[39m"

    echo -e "\033[38;5;148m 1 arg = $1  is the container name (not id)   \033[39m "

    CONTAINER_ID=$(docker ps -f 'name=$1' -q)

    echo -e "\033[38;5;148m docker exec -it $1 /bin/bash   \033[39m "

    docker exec -it $1 /bin/bash
}

# bagdo-docker-login-user () { #log into the contaier as a user #

#     echo -e "\033[38;5;148m Docker Container As Default \033[39m"

#     echo -e "\033[38;5;148m 1 arg = $1  is the container name (not id)   \033[39m "
#     echo -e "\033[38;5;148m 2 arg = $2  is the user name \033[39m "

#     CONTAINER_ID=$(docker ps -f 'name=$1' -q)

#     echo -e "\033[38;5;148m docker exec -u $2 -it $CONTAINER_ID /bin/bash   \033[39m "

#     docker exec -u $2 -it $CONTAINER_ID /bin/bash
# }

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

    echo -e "\033[38;5;148m 1 arg = $1  is the image name to push (example: accountname/ubuntu:1.0.1 \033[39m "

    echo -e "\033[38;5;148m docker push $1 \033[39m "

    docker push $1
}

bagdo-docker-delete-all-containers () { #deletes all container #

    echo -e "\033[38;5;148m Delete all containers  \033[39m"

    echo -e "\033[38;5;148m docker rm $(docker ps -a -q) --force \033[39m "

    docker rm $(docker ps -a -q) --force
}

bagdo-docker-delete-all-images () { #deletes all images #

    echo -e "\033[38;5;148m Delete all images  \033[39m"

    echo -e "\033[38;5;148m docker rmi $(docker images -q) --force \033[39m "

    docker rmi $(docker images -q) --force
}

bagdo-docker-run-mariadb () { #run docker mariadb

    ROOT_SHARED_DOCKER_DATA="$HOME/DockerMariaDBShared/mariadb"
    MARIADB_MOUNT_AT="$ROOT_SHARED_DOCKER_DATA/mariadb_10123"
    MARIADB_STORAGE_MOUNT_AT="$MARIADB_MOUNT_AT/storage"
    MARIADB_CONF_MOUNT_AT="$MARIADB_MOUNT_AT/conf.d"
    MARIADB_PORT="3333"
    MARIADB_CONTAINER_NAME="mariadb_10.1.23"
    TEMP_PASSWORD="mypass"

    echo -e "\033[38;5;148m Docker Run Detach Mariadb  \033[39m"
    echo -e "\033[38;5;148m 1 arg = $1  is the container name example mariadb   \033[39m "


    echo -e "\033[38;5;148m docker remove the docker / stop the docker \033[39m "

    docker stop "$MARIADB_CONTAINER_NAME";docker rm "$MARIADB_CONTAINER_NAME"

    echo -e "\033[38;5;148m docker run detach mariadb password mypass port \033[39m "
    echo -e "\033[38;5;148m MARIADB_CONF_MOUNT_AT: $MARIADB_CONF_MOUNT_AT \033[39m "
    echo -e "\033[38;5;148m MARIADB_STORAGE_MOUNT_AT: $MARIADB_STORAGE_MOUNT_AT \033[39m "

    docker run \
    --detach \
    --name=$MARIADB_CONTAINER_NAME \
    --env="MYSQL_ROOT_PASSWORD=mypass" \
    --publish $MARIADB_PORT:3306 \
    --volume=$MARIADB_CONF_MOUNT_AT:/etc/mysql/conf.d \
    --volume=$MARIADB_STORAGE_MOUNT_AT:/var/lib/mysql \
    mariadb:10.1.23

}