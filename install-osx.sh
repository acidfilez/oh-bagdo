#!/bin/sh

ROOT_HOME_PATH="$HOME/test2"
ROOT_BAGDO_PATH="$ROOT_HOME_PATH/.oh-bagdo"
ROOT_ZSHRC_FILE="$ROOT_HOME_PATH/.zshrc"
ROOT_GIT_URL="https://github.com/acidfilez/oh-bagdo.git"

echo -e "\033[38;5;148mTrying to install <Oh-Bagdo/>\033[39m"

if [ -d "$ROOT_BAGDO_PATH" ]; then
  echo -e "\033[38;5;148mSkip, Oh-Bagdo directory exist @:\033[39m $ROOT_BAGDO_PATH"
else
  echo -e "\033[38;5;148mFetching, Oh-Bagdo From:\033[39m $ROOT_GIT_URL"
  git clone $ROOT_GIT_URL $ROOT_BAGDO_PATH
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



