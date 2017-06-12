
#!/bin/bash

alias art="php artisan"


bagdo-art-serve() { #start laravel php in-built server #

  LARAVEL_HOST="--host=127.0.0.1"
  LARAVEL_PORT="--port=8000"

  echo -e "\033[38;5;148m 1 arg = $1  is the host default: localhost  \033[39m "
  echo -e "\033[38;5;148m 2 arg = $2  is the port default:8080 \033[39m "


  if [ "$1" != "" ]; then
    LARAVEL_HOST="--host=$1"
  fi

  if [ "$2" != "" ]; then
    LARAVEL_PORT="--port=$2"
  fi

  echo -e "\033[38;5;148m art server $LARAVEL_HOST $LARAVEL_PORT \033[39m"

  art serve $LARAVEL_HOST $LARAVEL_PORT
}


bagdo-art-routes() { # laravel show routes#

  echo -e "\033[38;5;148m art route:list \033[39m"

  art route:list
}


bagdo-art-migrate() { # migrate #

  echo -e "\033[38;5;148m art migrate \033[39m"

  art migrate
}


bagdo-art-db-seed() { # seed #

  echo -e "\033[38;5;148m 1 arg = $1  class to seed example: DatabaseSeeder  \033[39m "

  SEEDER_CLASS="--class=DatabaseProductionSeeder"

  if [ "$1" != "" ]; then
    SEEDER_CLASS="--class=$1"
  fi

  echo -e "\033[38;5;148m  art db:seed $SEEDER_CLASS \033[39m"

  art db:seed $SEEDER_CLASS
}


bagdo-laravel-run() { # laravel run server watch #

  echo -e "\033[38;5;148m npm run watch \033[39m"

  npm run watch
}


bagdo-composer-dump-autoload() { # composer recreate autoloads #

  echo -e "\033[38;5;148m composer dump-autoload \033[39m"

  composer dump-autoload
}


bagdo-composer-update() { # composer update #

  echo -e "\033[38;5;148m composer update \033[39m"

  composer update
}


bagdo-laravel-full-start() { # do everthing to start the laravel#

  bagdo-composer-update
  bagdo-art-migrate
  #bagdo-art-serve 127.0.0.1 8000 &&
  bagdo-laravel-run
}
