#!/bin/bash

#Bagdo alias for ruby

#Ruby PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


bagdo-rake-remigrate () { #this  #

    echo -e "\033[38;5;148m Rake a db:rollback and db:migrate \033[39m"

    echo "rake db:migrate:redo"

    rake db:migrate:redo
}

bagdo-rake-migrate-bot () { #this  #

    echo -e "\033[38;5;148m What type of migration you want to perfom ? xD \033[39m"

    echo -e "\033[38;5;148m     1) migrate: rake db:migrate \033[39m"
    echo -e "\033[38;5;148m     2) rollbadk: rake db:rollback \033[39m"
    echo -e "\033[38;5;148m     3) rollback and migrate: rake rake db:migrate:redo \033[39m"

    echo "Enter Option (1,2,3):"
    read line

    if [ "$line" = 1 ]; then
        echo "Doing: rake db:migrate, please wait"
        rake db:migrate
    fi

    if [ "$line" = 2 ]; then
        echo "Doing: rake db:rollback, please wait"
        rake db:rollback
    fi

    if [ "$line" = 3 ]; then
        echo "Doing rake db:migrate:redo, please wait"
        rake db:migrate:redo
    fi
}

bagdo-rake-routes () { #find routes by text #

    echo -e "\033[38;5;148m Find routes by text \033[39m"

    echo -e "\033[38;5;148m 1 arg = $1  is text pattern   \033[39m "

    echo "rake routes | grep $1"

    rake routes | grep $1
}


bagdo-ruby-check-external-systems () { #start looking for memcache, redis, mysql,  #

    echo -e "\033[38;5;148m Start looking for mysql, memcached, redis, solr \033[39m"
    echo -e "\033[38;5;148m Perfoming the following commands: \033[39m"
    echo -e 'ps aux | grep "[m]ysql"'
    echo -e 'ps aux | grep "[m]emcached"'
    echo -e 'ps aux | grep "[s]olr"'
    echo -e 'ps aux | grep "[r]edis"'
    echo -e 'ps aux | grep "[s]idekiq"'


    result_mysql=$(ps aux | grep "[m]ysql")
    result_memcached=$(ps aux | grep "[m]emcached")
    result_solr=$(ps aux | grep "[s]olr")
    result_redis=$(ps aux | grep "[r]edis")
    result_sidekiq=$(ps aux | grep "[s]idekiq")

    #result_mysql_port=$(lsof -i -P | grep -i "listen" | grep mysql)

    if [[ "$result_mysql" == '' ]]
    then
        echo -e "\033[38;5;148m Mysql is not setup please instal/start the service \033[39m"
    else
        echo -e "\033[38;5;148m Mysql ok \033[39m"
    fi

    if [[ "$result_memcached" == '' ]]
    then
        echo -e "\033[38;5;148m Memcached is not setup please instal/start the service \033[39m"
    else
        echo -e "\033[38;5;148m Memcached ok \033[39m"
    fi

    if [[ "$result_solr" == '' ]]
    then
        echo -e "\033[38;5;148m Solr is not setup please instal/start the service \033[39m"
    else
        echo -e "\033[38;5;148m Solr ok \033[39m"

    fi

    if [[ "$result_redis" == '' ]]
    then
        echo -e "\033[38;5;148m Redis is not setup please instal/start the service \033[39m"
    else
        echo -e "\033[38;5;148m Redis ok \033[39m"
    fi

    if [[ "$result_sidekiq" == '' ]]
    then
        echo -e "\033[38;5;148m Sidekiq is not setup please start the service \033[39m"
        echo -e "\033[38;5;148m run with foreman: 'foreman s' <= check your Procfile 'subl Procfile' \033[39m"
        echo -e "\033[38;5;148m or run it standalone: 'bundle exec sidekiq' \033[39m"
    else
        echo -e "\033[38;5;148m Sidekiq ok \033[39m"
    fi
}
