#!/bin/bash

# User configuration
export PATH="$PATH"

if [ "$HOME_BAGDO" = "" ]; then
  HOME_BAGDO=$(dirname "$0")
fi

################################################################################################################
# Bagdo commands starts here

export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

#Custom
alias "config-host"="subl /etc/hosts"
alias "config-zsh"="subl ~/.zshrc"
alias "config-ohbagdo"="subl $HOME_BAGDO/"
alias "config-ohbagdorc"="subl ~/.bagdorc"
alias "config-zhs-ohbagdo-plugin"="subl $HOME_BAGDO/"


#Editable bagdorc, users can edit this file instead :) to load plugings.
bagdorc="$HOME/.bagdorc"

bagdo-help () { #This help #arg 1 = pattern => example ssh will look for bagdo-ssh #
    echo -e "\033[38;5;148m Help File    \033[39m "
    echo -e "\033[38;5;148m 1 arg = $1    \033[39m "
    echo -e "\033[38;5;148mCommand List: \033[39m"

    grep  "^bagdo-$1" $HOME_BAGDO/tools/plugins/utilities.sh | sed 's/bagdo/- bagdo/g' | sed 's/()/ /g' | sed 's/{/ /g' | sed 's/#/\
    /g'

    grep  "^bagdo-$1" $HOME_BAGDO/tools/plugins/android.sh | sed 's/bagdo/- bagdo/g' | sed 's/()/ /g' | sed 's/{/ /g' | sed 's/#/\
    /g'

    grep  "^bagdo-$1" $HOME_BAGDO/tools/plugins/apple.sh | sed 's/bagdo/- bagdo/g' | sed 's/()/ /g' | sed 's/{/ /g' | sed 's/#/\
    /g'


    grep  "^bagdo-$1" $HOME_BAGDO/tools/plugins/development_apps.sh | sed 's/bagdo/- bagdo/g' | sed 's/()/ /g' | sed 's/{/ /g' | sed 's/#/\
    /g'

    grep  "^bagdo-$1" $HOME_BAGDO/tools/plugins/docker.sh | sed 's/bagdo/- bagdo/g' | sed 's/()/ /g' | sed 's/{/ /g' | sed 's/#/\
    /g'

    grep  "^bagdo-$1" $HOME_BAGDO/tools/plugins/ionic.sh | sed 's/bagdo/- bagdo/g' | sed 's/()/ /g' | sed 's/{/ /g' | sed 's/#/\
    /g'

    grep  "^bagdo-$1" $HOME_BAGDO/tools/plugins/nginx.sh | sed 's/bagdo/- bagdo/g' | sed 's/()/ /g' | sed 's/{/ /g' | sed 's/#/\
    /g'

    grep  "^bagdo-$1" $HOME_BAGDO/tools/plugins/ruby.sh | sed 's/bagdo/- bagdo/g' | sed 's/()/ /g' | sed 's/{/ /g' | sed 's/#/\
    /g'

    grep  "^bagdo-$1" $HOME_BAGDO/tools/plugins/ruby-gems/torquebox.sh | sed 's/bagdo/- bagdo/g' | sed 's/()/ /g' | sed 's/{/ /g' | sed 's/#/\
    /g'
}

bagdo-plugin-init () { # create bagdo init file#
    echo -e "\033[38;5;148m Creating $bagdorc File    \033[39m "
    echo -e "\033[38;5;148m Enable plugins like java, android, apple, ionic: \033[39m "
    echo -e "\033[38;5;148m vi $bagdorc  \033[39m "

cat <<END >$bagdorc
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

    #Enable ruby-gems commands (torquebox etc)
    #source $HOME_BAGDO/tools/plugins/ruby-gems/torquebox.sh
END
}

#finnaly check update, this will check git status, and ask to upgrade if necesary.
/bin/sh $HOME_BAGDO/tools/upgrade.sh

#check if the plugins are loaded
if [ -f "$bagdorc" ];
then
  source $bagdorc
else
  echo -e "\033[38;5;148m .bagdorc not found, please create it using:   \033[39m "
  echo -e "\033[38;5;148m bagdo-plugin-init  \033[39m "
fi
