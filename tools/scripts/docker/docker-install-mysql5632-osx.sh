#!/bin/bash

ROOT_SHARED_DOCKER_DATA="$HOME/DockerMysqlShared/mysql"
MYSQL_MOUNT_AT="$ROOT_SHARED_DOCKER_DATA/msyql_5632"
MYSQL_STORAGE_MOUNT_AT="$MYSQL_MOUNT_AT/storage"
MYSQL_CONF_MOUNT_AT="$MYSQL_MOUNT_AT/conf.d"
MYSQL_PORT="3306"
MYSQL_CONTAINER_NAME="modyo-mysql_5.6.32"
TEMP_PASSWORD="mypassword"
default_wait=3   # in seconds

bagdo-install-mysql5632 () {

  echo -e "\033[38;5;148m Setting up a mysql 5.6.32 \033[39m"
  echo -e ""
  echo -e "\033[38;5;148m What you need: \033[39m"
  echo -e "\033[38;5;148m oh-my-zsh properly installed \033[39m"
  echo -e "\033[38;5;148m docker running \033[39m"
  echo -e "\033[38;5;148m internet access \033[39m"
  echo -e "\033[38;5;148m good actitude \033[39m"
  echo -e ""
  echo -e "\033[38;5;148m Going to perform the following steps: \033[39m"

  echo -e "\033[38;5;148m step 1: pull from docker hub: mysql:5.6.32  \033[39m"
  docker pull mysql:5.6.32


  echo -e "\033[38;5;148m step 2: create a shared folder at: $ROOT_SHARED_DOCKER_DATA \033[39m"
  mkdir -p $ROOT_SHARED_DOCKER_DATA

  echo -e "\033[38;5;148m step 3: create a shared folder at: $MYSQL_STORAGE_MOUNT_AT \033[39m"
  mkdir -p $MYSQL_STORAGE_MOUNT_AT

  echo -e "\033[38;5;148m step 4: create a shared folder at: $MYSQL_CONF_MOUNT_AT \033[39m"
  mkdir -p $MYSQL_CONF_MOUNT_AT


  echo -e "\033[38;5;148m step 5: making your conf file: $MYSQL_CONF_MOUNT_AT/my-custom.cnf \033[39m"
cat <<END >"$MYSQL_CONF_MOUNT_AT/my-custom.cnf"
[mysqld]
max_connections=200
END

echo -e "\033[38;5;148m step 6: run the container, but first \033[39m"
  echo -e "\033[38;5;148m please enter the new container name: 'modyo-mysql' \033[39m"
  read MYSQL_CONTAINER_NAME
  echo -e "\033[38;5;148m please enter the new container port: '3306' \033[39m"
  read MYSQL_PORT


docker run \
--detach \
--name=$MYSQL_CONTAINER_NAME \
--env="MYSQL_ROOT_PASSWORD=$TEMP_PASSWORD" \
--publish $MYSQL_PORT:3306 \
--volume=$MYSQL_CONF_MOUNT_AT:/etc/mysql/conf.d \
--volume=$MYSQL_STORAGE_MOUNT_AT:/var/lib/mysql \
mysql:5.6.32

#echo -e "\033[38;5;148m step 7: reseting the password to nul \033[39m"

# while ! mysql -p$MYSQL_PORT -P$TEMP_PASSWORD -h 127.0.0.1 -e ";" ; do echo "Sleeping for $default_wait seconds to allow MySQL to initialise...\n" && sleep $default_wait; done;
# mysql -p$MYSQL_PORT -P$TEMP_PASSWORD -h 127.0.0.1 -e "select 'Mysql Is Ready' as Status;"
# mysql -p$MYSQL_PORT -P$TEMP_PASSWORD -h 127.0.0.1 -e "use mysql;update user set password='' where User='root';"

# echo -e "\033[38;5;148m step 8: restarting mysql \033[39m"

# docker stop $MYSQL_CONTAINER_NAME
# docker start $MYSQL_CONTAINER_NAME

}

bagdo-install-mysql5632
