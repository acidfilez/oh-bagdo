
#Bagdo alias for android

bagdo-rake-remigrate () { #this  #

    echo -e "\033[38;5;148m Rake a db:rollback and db:migrate \033[39m"

    echo "rake db:rollback && rake db:migrate"

    rake db:rollback && rake db:migrate
}

bagdo-rake-routes () { #find routes by text #

    echo -e "\033[38;5;148m Find routes by text \033[39m"

    echo -e "\033[38;5;148m 1 arg = $1  is text pattern   \033[39m "

    echo "rake routes | grep $1"

    rake routes | grep $1
}


bagdo-ruby-check-external-systems () { #start looking for memcache, redis, mysql,  #

    echo -e "\033[38;5;148m Start looking for mysql, memcached, redis, solr \033[39m"


    echo -e 'ps aux | grep "[m]ysql"'
    echo -e 'ps aux | grep "[m]emcached"'
    echo -e 'ps aux | grep "[s]olr"'
    echo -e 'ps aux | grep "[r]edis"'

    result_mysql=$(ps aux | grep "[m]ysql")
    result_memcached=$(ps aux | grep "[m]emcached")
    result_solr=$(ps aux | grep "[s]olr")
    result_redis=$(ps aux | grep "[r]edis")
    result_wow22=$(ps aux | grep "[w]ow22")

    echo -e "aer: $result_wow22"
    echo -e "$result_mysql"
}