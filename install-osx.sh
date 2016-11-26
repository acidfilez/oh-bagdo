#!/bin/sh

ROOT_HOME_PATH="$HOME"
ROOT_BAGDO_PATH="$ROOT_HOME_PATH/.oh-bagdo"
ROOT_GIT_URL="https://github.com/acidfilez/oh-bagdo.git"
ROOT_BAGDORC_FILE="$ROOT_HOME_PATH/.bagdorc"
ROOT_ZSHRC_FILE="$ROOT_HOME_PATH/.zshrc"


bagdo-plugin-install () { # create bagdo init file#
    echo -e "\033[38;5;148m Creating $ROOT_BAGDORC_FILE File    \033[39m "
    echo -e "\033[38;5;148m Enable plugins like java, android, apple, ionic: \033[39m "
    echo -e "\033[38;5;148m vi $ROOT_BAGDORC_FILE  \033[39m "

cat <<END >$ROOT_BAGDORC_FILE
    #Enable java
    #source $HOME_BAGDO/tools/plugins/java.sh

    #Enable unix utilites commands
    #source $HOME_BAGDO/tools/plugins/utilities.sh

    #Enable android commands
    #source $HOME_BAGDO/tools/plugins/android.sh

    #Enable apple commands
    #source $HOME_BAGDO/tools/plugins/apple.sh

    #Enable development applications like subl, xcode, etc commands
    #source $HOME_BAGDO/tools/plugins/development_apps.sh

    #Enable docker commands
    #source $HOME_BAGDO/tools/plugins/docker.sh

    #Enable ionic commands
    #source $HOME_BAGDO/tools/plugins/ionic.sh

    #Enable nginix commands, for mac only
    #source $HOME_BAGDO/tools/plugins/nginx.sh

    #Enable ruby commands
    #source $HOME_BAGDO/tools/plugins/ruby.sh
END
}

echo -e "\033[38;5;148mTrying to install <Oh-Bagdo/>\033[39m"

if [ -d "$ROOT_BAGDO_PATH" ]; then
  echo -e "\033[38;5;148mSkip, Oh-Bagdo directory exist @:\033[39m $ROOT_BAGDO_PATH"
else
  echo -e "\033[38;5;148mFetching, Oh-Bagdo From:\033[39m $ROOT_GIT_URL"
  git clone $ROOT_GIT_URL $ROOT_BAGDO_PATH

  if [ -f "$ROOT_BAGDORC_FILE" ]; then
    echo -e "\033[38;5;148mSkip, .bagdorc file exist @:\033[39m $ROOT_BAGDORC_FILE"
  else
    bagdo-plugin-install
  fi

fi

result=$(grep "Bootstrap Oh-Bagdo" $ROOT_ZSHRC_FILE)

if [ ! "$result" = "" ]
  then
    echo -e "\033[38;5;148mSkip, Oh-Bagdo already addedin your:\033[39m $ROOT_ZSHRC_FILE"
  else
    echo -e "\033[38;5;148mAdding, Oh-Bagdo in your: \033[39m$ROOT_ZSHRC_FILE"
    cat <<EOT >> $ROOT_ZSHRC_FILE

#Bootstrap Oh-Bagdo
export HOME_BAGDO=$HOME/.oh-bagdo
source $HOME_BAGDO/.bagdorc

EOT
fi



