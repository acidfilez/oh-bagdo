#!/bin/bash

ROOT_HOME_PATH="$HOME"
ROOT_BAGDO_PATH="$ROOT_HOME_PATH/.oh-bagdo"
ROOT_BAGDO_ZSH_PATH="$ZSH/custom/plugins/oh-bagdo"
ROOT_GIT_URL="https://github.com/acidfilez/oh-bagdo.git"
ROOT_BAGDORC_FILE="$ROOT_HOME_PATH/.bagdorc"
ROOT_ZSHRC_FILE="$ROOT_HOME_PATH/.zshrc"
ROOT_SHARED_DOCKER_DATA="$HOME/DockerSolrShared"
ROOT_CONTAINER_NAME="solr-initial-run"
CORE_NAME="bagdo-core"
SOLR_PORT="8080"
SOLR_NAME="modyo-solr5"

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

  echo -e "\033[38;5;148m step 4: create the solr.xml in your shared folder\033[39m"
  docker cp modyo-solr2:/opt/solr/example/solr/solr.xml $ROOT_SHARED_DOCKER_DATA/solr.xml

  echo -e "\033[38;5;148m step 5: create the collection(aka core) \033[39m"
  docker cp modyo-solr2:/opt/solr/example/solr/modyo_test $ROOT_SHARED_DOCKER_DATA

  echo -e "\033[38;5;148m step 6: rename the collection \033[39m"
  read CORE_NAME

  PATH_CORE="$ROOT_SHARED_DOCKER_DATA/$CORE_NAME"

  cp -av "$ROOT_SHARED_DOCKER_DATA/modyo_test" "$PATH_CORE"
  rm -rf "$ROOT_SHARED_DOCKER_DATA/modyo_test"

  echo -e "\033[38;5;148m step 7: configure collection: $PATH_CORE/conf/core.properties \033[39m"
cat <<END >"$PATH_CORE/conf/core.properties"
solr.data.dir=/usr/share/solr/$CORE_NAME/data
END

  echo -e "\033[38;5;148m step 8: configure solr.xml: $ROOT_SHARED_DOCKER_DATA/solr.xml \033[39m"
  echo -e "\033[38;5;148m please add the following core \033[39m"

  echo '<core name="copec" instanceDir="copec" dataDir="/opt/solr/example/solr/$CORE_NAME/data">'
  echo '</core>'

  echo -e "\033[38;5;148m step 9: stop the temporal container \033[39m"
  docker stop $ROOT_CONTAINER_NAME && docker rm $ROOT_CONTAINER_NAME

  echo -e "\033[38;5;148m step 10: run the container, but first \033[39m"
  echo -e "\033[38;5;148m step 10: new container name: \033[39m"
  read SOLR_NAME
  echo -e "\033[38;5;148m step 10: new container port: \033[39m"
  read SOLR_PORT

  echo -e "\033[38;5;148m docker run --name $SOLR_NAME -d -p $SOLR_PORT:8080 -v $PATH_CORE/copec:/opt/solr/example/solr/copec -v /Users/mch/DockerSolrShared/solr.xml:/opt/solr/example/solr/solr.xml modyodx/modyo-solr:1.1 \033[39m"

  "docker run --name modyo-solr -d -p 8080:8080 -v $PATH_CORE:/opt/solr/example/solr/copec -v /Users/mch/DockerSolrShared/solr.xml:/opt/solr/example/solr/solr.xml modyodx/modyo-solr:1.1"

}


## Inner functions Below
bagdo-clone () {


}



bagdo-install-solor4.2 ()
