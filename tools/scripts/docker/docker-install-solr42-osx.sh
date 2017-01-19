#!/bin/bash

ROOT_HOME_PATH="$HOME"
ROOT_BAGDO_PATH="$ROOT_HOME_PATH/.oh-bagdo"
ROOT_BAGDO_ZSH_PATH="$ZSH/custom/plugins/oh-bagdo"
ROOT_GIT_URL="https://github.com/acidfilez/oh-bagdo.git"
ROOT_BAGDORC_FILE="$ROOT_HOME_PATH/.bagdorc"
ROOT_ZSHRC_FILE="$ROOT_HOME_PATH/.zshrc"
ROOT_SHARED_DOCKER_DATA="$HOME/DockerSolrShared/solr42"
SOLR42_MOUNT_AT="$ROOT_SHARED_DOCKER_DATA/solr"
ROOT_CONTAINER_NAME="solr-initial-run"
CORE_NAME="bagdo-core"
SOLR_PORT="8080"
SOLR_NAME="modyo-solr"

bagdo-install-solor4.2 () {

  echo -e "\033[38;5;148m Setting up a solr 4.2 \033[39m"
  echo -e ""
  echo -e "\033[38;5;148m What you need: \033[39m"
  echo -e "\033[38;5;148m oh-my-zsh properly installed \033[39m"
  echo -e "\033[38;5;148m docker running \033[39m"
  echo -e "\033[38;5;148m internet access \033[39m"
  echo -e "\033[38;5;148m good actitude \033[39m"
  echo -e ""
  echo -e "\033[38;5;148m Going to perform the following steps: \033[39m"

  echo -e "\033[38;5;148m step 1: pull from docker hub: modyodx/modyo-solr:1.1  \033[39m"
  docker pull modyodx/modyo-solr:1.1

  echo -e "\033[38;5;148m step 2: run a temporal docker container named: $ROOT_CONTAINER_NAME \033[39m"
  docker run --name $ROOT_CONTAINER_NAME -d modyodx/modyo-solr:1.1

  echo -e "\033[38;5;148m step 3: create a shared folder at: $ROOT_SHARED_DOCKER_DATA \033[39m"
  mkdir -p $ROOT_SHARED_DOCKER_DATA

  echo -e "\033[38;5;148m step 4: create the solr42 shared folder\033[39m"
  echo "docker cp $ROOT_CONTAINER_NAME:/opt/solr/example/solr $ROOT_SHARED_DOCKER_DATA"
  docker cp $ROOT_CONTAINER_NAME:/opt/solr/example/solr $ROOT_SHARED_DOCKER_DATA

  # echo -e "\033[38;5;148m step 5: create the collection(aka core) \033[39m"
  # docker cp $ROOT_CONTAINER_NAME:/opt/solr/example/solr/modyo_test $ROOT_SHARED_DOCKER_DATA
  echo -e "\033[38;5;148m step 5: create the collection(aka core) \033[39m"
  tar -xvzf $SOLR42_MOUNT_AT/modyo_test.tar.gz

  echo -e "\033[38;5;148m step 6: rename the collection \033[39m"
  echo -e "\033[38;5;148m Please input the new core name: \033[39m"
  read CORE_NAME

  PATH_CORE="$SOLR42_MOUNT_AT/$CORE_NAME"
  cp -av "$SOLR42_MOUNT_AT/modyo_test" "$PATH_CORE"
  rm -rf "$SOLR42_MOUNT_AT/modyo_test"

  echo -e "\033[38;5;148m step 7: configure collection: $PATH_CORE/conf/core.properties \033[39m"
cat <<END >"$PATH_CORE/conf/core.properties"
solr.data.dir=/usr/share/solr/$CORE_NAME/data
END

  echo -e "\033[38;5;148m step 8: configure solr.xml: $SOLR42_MOUNT_AT/solr.xml \033[39m"

  NEWCORESETTING="  <core name=\"$CORE_NAME\" instanceDir=\"$CORE_NAME\" dataDir=\"\/opt\/solr\/example\/solr\/$CORE_NAME\/data\"><\/core>\\\n<\/cores>"
  COREXMLTAG="<\/cores>"

  echo -e "\033[38;5;148m adding new configuration core into the solr.xml \033[39m"
  echo -e "\033[38;5;148m <core name=\"$CORE_NAME\" instanceDir=\"$CORE_NAME\" dataDir=\"\/opt\/solr\/example\/solr\/$CORE_NAME\/data\"><\/core> \033[39m"

  #add the core
  sed -i.bak "s/$COREXMLTAG/$NEWCORESETTING/g" $SOLR42_MOUNT_AT/solr.xml
sed -i.bak 's/\\n/\
/' $SOLR42_MOUNT_AT/solr.xml

  echo -e "\033[38;5;148m step 9: stop the temporal container, and remove the temporal container:$ROOT_CONTAINER_NAME\033[39m"
  docker stop $ROOT_CONTAINER_NAME && docker rm $ROOT_CONTAINER_NAME

  echo -e "\033[38;5;148m step 10: run the container, but first \033[39m"
  echo -e "\033[38;5;148m step 10: please enter the new container name: 'solr42' \033[39m"
  read SOLR_NAME
  echo -e "\033[38;5;148m step 10: please enter the new container port: '8080' \033[39m"
  read SOLR_PORT

  echo -e "\033[38;5;148m docker run --name $SOLR_NAME -d -p $SOLR_PORT:8080 -v $SOLR42_MOUNT_AT:/opt/solr/example/solr/  modyodx/modyo-solr:1.1 \033[39m"

  docker run --name $SOLR_NAME -d -p $SOLR_PORT:8080 -v $SOLR42_MOUNT_AT:/opt/solr/example/solr/  modyodx/modyo-solr:1.1


  echo -e "\033[38;5;148m check your solr and collection at: \033[39m"
  echo -e "\033[38;5;148m http://localhost:$SOLR_PORT/solr/ \033[39m"
  echo -e "\033[38;5;148m http://localhost:$SOLR_PORT/solr/#/~cores/$CORE_NAME \033[39m"

  echo -e "\033[38;5;148m  \033[39m"
  echo -e "\033[38;5;148m  To Create New Core: \033[39m"
  echo -e "\033[38;5;148m  Note: pst, your docker container name is: $SOLR_NAME \033[39m"
  echo -e "\033[38;5;148m  cd $SOLR42_MOUNT_AT;sh create_core.sh \033[39m"

}


bagdo-install-solor4.2
