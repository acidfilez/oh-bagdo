#!/bin/bash

ROOT_SHARED_DOCKER_DATA="$HOME/DockerMariaDBShared/mariadb"
MARIADB_MOUNT_AT="$ROOT_SHARED_DOCKER_DATA/mariadb_10123"
MARIADB_STORAGE_MOUNT_AT="$MARIADB_MOUNT_AT/storage"
MARIADB_CONF_MOUNT_AT="$MARIADB_MOUNT_AT/conf.d"
MARIADB_PORT="3333"
MARIADB_CONTAINER_NAME="mariadb_10.1.23"
TEMP_PASSWORD="mypass"
default_wait=3   # in seconds

bagdo-install-mariadb10123 () {

  echo -e "\033[38;5;148m Setting up a mariadb 10.1.23 \033[39m"
  echo -e ""
  echo -e "\033[38;5;148m What you need: \033[39m"
  echo -e "\033[38;5;148m oh-my-zsh properly installed \033[39m"
  echo -e "\033[38;5;148m docker running \033[39m"
  echo -e "\033[38;5;148m internet access \033[39m"
  echo -e "\033[38;5;148m good actitude \033[39m"
  echo -e ""
  echo -e "\033[38;5;148m Going to perform the following steps: \033[39m"

  echo -e "\033[38;5;148m step 1: pull from docker hub: mariadb:10.1.23  \033[39m"
  docker pull mariadb:10.1.23


  if [ -d "$ROOT_SHARED_DOCKER_DATA" ]; then
        echo -e "\033[38;5;148m Skip, Shared data exist @:\033[39m $ROOT_SHARED_DOCKER_DATA"
      else
        echo -e "\033[38;5;148m Creating in  @:\033[39m $ROOT_SHARED_DOCKER_DATA"

        echo -e "\033[38;5;148m step 2: create a shared folder at: $ROOT_SHARED_DOCKER_DATA \033[39m"
      mkdir -p $ROOT_SHARED_DOCKER_DATA

      echo -e "\033[38;5;148m step 3: create a shared folder at: $MARIADB_STORAGE_MOUNT_AT \033[39m"
      mkdir -p $MARIADB_STORAGE_MOUNT_AT

      echo -e "\033[38;5;148m step 4: create a shared folder at: $MARIADB_CONF_MOUNT_AT \033[39m"
      mkdir -p $MARIADB_CONF_MOUNT_AT


      echo -e "\033[38;5;148m step 5: making your conf file: $MARIADB_CONF_MOUNT_AT/my-custom.cnf \033[39m"
cat <<END >"$MARIADB_CONF_MOUNT_AT/my-custom.cnf"
[mariadbd]
max_connections=200
END
  fi


  echo -e "\033[38;5;148m step 6: run the container, but first \033[39m"
  echo -e "\033[38;5;148m please enter the new container name: '$MARIADB_CONTAINER_NAME' \033[39m"
  read MARIADB_CONTAINER_NAME
  echo -e "\033[38;5;148m please enter the new container port: '$MARIADB_PORT' \033[39m"
  read MARIADB_PORT


docker run \
--detach \
--name=$MARIADB_CONTAINER_NAME \
--env="MYSQL_ROOT_PASSWORD=$TEMP_PASSWORD" \
--publish $MARIADB_PORT:3306 \
--volume=$MARIADB_CONF_MOUNT_AT:/etc/mysql/conf.d \
--volume=$MARIADB_STORAGE_MOUNT_AT:/var/lib/mysql \
mariadb:10.1.23

}

bagdo-install-mariadb10123
