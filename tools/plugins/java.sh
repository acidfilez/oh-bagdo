export JAVA_HOME="$(/usr/libexec/java_home)"

#Add Some Optimizations
#JAVA_OPTS='-Xss1m -Xmn512m -Xms2048m -Xmx2048m -XX:ReservedCodeCacheSize=128m -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M -XX:+UseConcMarkSweepGC'
#
#



bagdo-java-sdks () { #this helper lets you see which java are setup  #

    echo -e "\033[38;5;148m ==> You are using: $JAVA_HOME \033[39m"
    echo -e "\033[38;5;148m  \033[39m"
    echo -e "\033[38;5;148m Checking for other jdks installed on your machine: \033[39m"
    echo -e "\033[38;5;148m ls -la /Library/Java/JavaVirtualMachines ? xD \033[39m"

    array=($(ls -Al /Library/Java/JavaVirtualMachines | tr -s ' ' | cut -f9- -d' ' | grep jdk))

    COUNTER=0
    for i in "${array[@]}"
    do
      echo -e "\033[38;5;148m     $COUNTER) $i \033[39m"
      echo -e "\033[38;5;148m       perform export JAVA_HOME=/Library/Java/JavaVirtualMachines/$i/Contents/Home \033[39m"
      let COUNTER+=1
    done

    # echo "Enter Option (0..1):"
    # read line

    # sdk_target="$array[$line]"
    # echo -e "\033[38;5;148m export JAVA_HOME=/Library/Java/JavaVirtualMachines/$array[$sdk_target]/Contents/Home \033[39m"

}

bagdo-java-sdks-7 () { #this helper lets you see which java are setup  #

    export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home'
    export JAVA_OPTS='-Xss1m -Xmn512m -Xms2048m -Xmx2048m -XX:ReservedCodeCacheSize=128m -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M -XX:+UseConcMarkSweepGC'
    echo -e "\033[38;5;148m ==> You are using: $JAVA_HOME \033[39m"
    echo -e "\033[38;5;148m ==> JAVA_OPTS: $JAVA_OPTS \033[39m"
}


bagdo-java-sdks-8 () { #this helper lets you see which java are setup  #
    export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_101.jdk/Contents/Home'
    export JAVA_OPTS='-Xms2g -Xmx4g  -XX:MaxMetaspaceSize=1g -XX:+CMSClassUnloadingEnabled -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled -Djava.net.preferIPv4Stack=true -Djboss.modules.system.pkgs=org.jboss.byteman -Djava.awt.headless=true'
    echo -e "\033[38;5;148m ==> You are using: $JAVA_HOME \033[39m"
    echo -e "\033[38;5;148m ==> JAVA_OPTS: $JAVA_OPTS \033[39m"
}

