#!/bin/bash

ROOT_HOME_PATH="$HOME"
ROOT_BAGDO_PATH="$ROOT_HOME_PATH/.oh-bagdo"
ROOT_BAGDO_ZSH_PATH="$ZSH/custom/plugins/oh-bagdo"
ROOT_GIT_URL="https://github.com/acidfilez/oh-bagdo.git"
ROOT_BAGDORC_FILE="$ROOT_HOME_PATH/.bagdorc"
ROOT_ZSHRC_FILE="$ROOT_HOME_PATH/.zshrc"

INSTALL_TYPE=0

bagdo-install () {

  echo -e "\033[38;5;148m Trying to install <Oh-Bagdo/>\033[39m"

  bagdo-clone

  if [ "$INSTALL_TYPE" = 1 ]; then
    bagdo-zshrc
    bagdo-rc-file-install
    bagdo-end
  elif [ "$INSTALL_TYPE" = 2 ]; then
    bagdo-rc-file-install
    bagdo-end
  else
    echo -e "\033[38;5;148m Good Bye \033[39m"
  fi
}


## Inner functions Below
bagdo-clone () {

  echo -e "\033[38;5;148m What type of installation do you want to perfom ? xD \033[39m"

  echo -e "\033[38;5;148m     1) Install Oh-Bagdo at home: $ROOT_BAGDO_PATH \033[39m"
  echo -e "\033[38;5;148m     2) Install Oh-Bagdo as zsh plugin: $ROOT_BAGDO_ZSH_PATH \033[39m"

  echo "Enter Option (1,2):"

  read INSTALL_TYPE  < /proc/${PPID}/fd/0

  if [ "$INSTALL_TYPE" = 1 ]; then
    if [ -d "$ROOT_BAGDO_PATH" ]; then
      echo -e "\033[38;5;148m Skip, Oh-Bagdo directory exist @:\033[39m $ROOT_BAGDO_PATH"
    else
      echo -e "\033[38;5;148m Fetching, Oh-Bagdo From:\033[39m $ROOT_GIT_URL"
      git clone $ROOT_GIT_URL $ROOT_BAGDO_PATH
    fi
  fi

  if [ "$INSTALL_TYPE" = 2 ]; then
    if [ -d "$ROOT_BAGDO_ZSH_PATH" ]; then
      echo -e "\033[38;5;148m Skip, Oh-Bagdo directory exist @:\033[39m $ROOT_BAGDO_ZSH_PATH"
    else
      echo -e "\033[38;5;148m Fetching, Oh-Bagdo From:\033[39m $ROOT_GIT_URL"
      git clone $ROOT_GIT_URL $ROOT_BAGDO_ZSH_PATH
    fi
  fi

}

bagdo-zshrc () {

result=$(grep "Bootstrap Oh-Bagdo" $ROOT_ZSHRC_FILE)

if [ ! "$result" = "" ]
  then
    echo -e "\033[38;5;148m Skip, Oh-Bagdo already addedin your:\033[39m $ROOT_ZSHRC_FILE"
  else
    echo -e "\033[38;5;148m Modifying File: \033[39m$ROOT_ZSHRC_FILE"

cat <<EOT >> $ROOT_ZSHRC_FILE

#Bootstrap Oh-Bagdo
export HOME_BAGDO=\$HOME/.oh-bagdo
source \$HOME_BAGDO/.bagdorc

EOT
fi

}

bagdo-rc-file-install () { # create bagdo rc file#

if [ -f "$ROOT_BAGDORC_FILE" ]; then
  echo -e "\033[38;5;148m Skip, .bagdorc file exist @:\033[39m $ROOT_BAGDORC_FILE"
else
  echo -e "\033[38;5;148m Creating $ROOT_BAGDORC_FILE File    \033[39m "
  echo -e "\033[38;5;148m Enable plugins like java, android, apple, ionic: \033[39m "
  echo -e "\033[38;5;148m vi $ROOT_BAGDORC_FILE  \033[39m "

cat <<END >$ROOT_BAGDORC_FILE
    #Enable java
    #source \$HOME_BAGDO/tools/plugins/java.sh

    #Enable unix utilites commands
    #source \$HOME_BAGDO/tools/plugins/utilities.sh

    #Enable android commands
    #source \$HOME_BAGDO/tools/plugins/android.sh

    #Enable apple commands
    #source \$HOME_BAGDO/tools/plugins/apple.sh

    #Enable development applications like subl, xcode, etc commands
    #source \$HOME_BAGDO/tools/plugins/development_apps.sh

    #Enable docker commands
    #source \$HOME_BAGDO/tools/plugins/docker.sh

    #Enable ionic commands
    #source \$HOME_BAGDO/tools/plugins/ionic.sh

    #Enable nginix commands, for mac only
    #source \$HOME_BAGDO/tools/plugins/nginx.sh

    #Enable ruby commands
    #source \$HOME_BAGDO/tools/plugins/ruby.sh
END

fi

}

bagdo-end () {

echo -e "\033[38;5;148m Oh-Bagdo is ready but before ... \033[39m"

if [ "$INSTALL_TYPE" = 1 ]; then
  echo -e "\033[38;5;148m Look for the comment '#Bootstrap Oh-Bagdo' in your .zshrc File: \033[39m$ROOT_ZSHRC_FILE"
  echo -e "\033[38;5;148m finally please do a: source ~/.zshrc\033[39m"

fi
if [ "$INSTALL_TYPE" = 2 ]; then
  plugins_installed=$(more $ROOT_ZSHRC_FILE | grep '^plugins.*=.*)')
  echo -e "\033[38;5;148m Found, oh-my-zsh plugin installed: \033[39m"
  echo -e "\033[38;5;148m $plugins_installed \033[39m"
  echo -e "\033[38;5;148m please add 'oh-bagdo' plugin, for example 'plugins=(git oh-bagdo)', edit .zshrc File: \033[39m$ROOT_ZSHRC_FILE"
  echo -e "\033[38;5;148m finally please do a: source ~/.zshrc\033[39m"
fi

}

##Main Installation

bagdo-install
