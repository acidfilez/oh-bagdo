
#Bagdo alias for android

#Please set to the correct version
export ANDROID_BUILD_TOOLS_VERSION=24.0.3

export ANDROID_PLATFORM_TOOLS=$HOME/Library/Android/sdk/platform-tools
export ANDROID_BUILD_TOOLS=$ANDROID_PLATFORM_TOOLS/../build-tools/$ANDROID_BUILD_TOOLS_VERSION/

if [ -d "$ANDROID_PLATFORM_TOOLS" ]; then
    if [ -d "$ANDROID_BUILD_TOOLS" ]; then
        export PATH=$PATH:$ANDROID_PLATFORM_TOOLS:$ANDROID_BUILD_TOOLS

        #add extra android scripts from the bagdo/scripts/android folder, for example adb+
        export AND_BAGDO_EXT="$HOME_BAGDO/tools/scripts/android"
        export PATH=$PATH:$ANDROID_PLATFORM_TOOLS:$ANDROID_BUILD_TOOLS:$AND_BAGDO_EXT
    else
        echo -e "\e[31m Andorid build-tools are not defined   \e[0m"
        echo -e "\033[38;5;148m ANDROID_BUILD_TOOLS:  $ANDROID_BUILD_TOOLS \033[39m "
        echo -e "\e[32m Fixit by editing: $HOME_BAGDO/tools/plugins/android.sh \e[0m "
        echo -e "\e[32m and installing android sdk \e[0m "
    fi
else
    echo -e "\e[31m Andorid platform-tools are not defined   \e[0m"
    echo -e "\033[38;5;148m ANDROID_PLATFORM_TOOLS:  $ANDROID_PLATFORM_TOOLS \033[39m "
    echo -e "\e[32m Fixit by editing: $HOME_BAGDO/tools/plugins/android.sh \e[0m "
    echo -e "\e[32m and installing android sdk \e[0m "
fi


bagdo-android-logs () { #log android device via tag #

    echo -e "\033[38;5;148m Android Device Logs \033[39m"

    echo "adb logcat -v time"

    adb logcat -v time
}

bagdo-android-log-analitics () { #log android device via tag #

    echo -e "\033[38;5;148m Android Device Logs \033[39m"

    echo "adb shell setprop log.tag.GAv4 DEBUG"
    echo "adb logcat -v time -s GAv4"

    adb shell setprop log.tag.GAv4 DEBUG
    adb logcat -v time -s GAv4
}

bagdo-android-log-tag () { #log android device via tag #

    echo -e "\033[38;5;148m Android Device Logs \033[39m"

    echo -e "\033[38;5;148m 1 arg = $1  is a tag   \033[39m "

    echo "adb shell setprop log.tag.$1 DEBUG"
    echo "adb logcat -v time -s $1"

    adb shell setprop log.tag.$1 DEBUG
    adb logcat -v time -s $1
}

