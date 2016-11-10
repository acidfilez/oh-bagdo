#Ionics

bagdo-ionic-release-android () { #ionic full android release #

    echo -e "\033[38;5;148m Ionic Full Android Release \033[39m"
    echo "Executing: ionic build android --release"
    echo "Executing: jarsigner && zipalign"
    echo "Executing: adb install"

    echo -e "\033[38;5;148m Building Android Release \033[39m"

    ionic build android --release

    echo -e "\033[38;5;148m Sign Android armv7 Release \033[39m"

    echo "Press y to continue building armv7..."

    read line

    if [ "$line" = Y ] || [ "$line" = y ] || [ -z "$line" ]; then

        # Space pressed, do something

        jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore ../credentials/CredencialesPagoClickAndroid/copec.key platforms/android/build/outputs/apk/android-armv7-release-unsigned.apk pagoclick
        rm platforms/android/build/outputs/apk/copec_pagoclick_armv7.apk
        $ANDROID_PLATFORM_TOOLS/../build-tools/24.0.3/zipalign -v 4 platforms/android/build/outputs/apk/android-armv7-release-unsigned.apk platforms/android/build/outputs/apk/copec_pagoclick_armv7.apk


    else
        # Anything else pressed, do whatever else.
        echo "Skipping armv7"
    fi

    echo -e "\033[38;5;148m Sign Android x86 Release \033[39m"

    echo "Press y to continue building x86..."

    read line

    if [ "$line" = Y ] || [ "$line" = y ] || [ -z "$line" ]; then
        # Space pressed, do something

        jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore ../credentials/CredencialesPagoClickAndroid/copec.key platforms/android/build/outputs/apk/android-x86-release-unsigned.apk pagoclick
        rm platforms/android/build/outputs/apk/copec_pagoclick_x86.apk
        $ANDROID_PLATFORM_TOOLS/../build-tools/24.0.3/zipalign -v 4 platforms/android/build/outputs/apk/android-x86-release-unsigned.apk  platforms/android/build/outputs/apk/copec_pagoclick_x86.apk

    else
        # Anything else pressed, do whatever else.
        echo "Skipping x86"
    fi




    echo -e "\033[38;5;148m Now You can Manually install this via adb \033[39m"

    echo

    echo "adb install -r platforms/android/build/outputs/apk/copec_pagoclick_armv7.apk"
    echo "adb install -r platforms/android/build/outputs/apk/copec_pagoclick_x86.apk"
}

bagdo-ionic-reset () { #ionic state reset #

   echo -e "\033[38;5;148m Ionic State Reset for IOS and Android \033[39m"
   echo "Executing: ionic state reset"
   ionic state reset
}

bagdo-ionic-platform-reset-android () { #reset android platform #

   echo -e "\033[38;5;148m Ionic Reset Platform Android \033[39m"
   echo "Executing: ionic platform rm android; ionic platform add android;"

   ionic platform rm android; ionic platform add android;
}

bagdo-ionic-platform-reset-ios () { #reset ios platform #

   echo -e "\033[38;5;148m Ionic Reset Platform iOS \033[39m"
   echo "Executing: ionic platform rm ios; ionic platform add ios;"

   ionic platform rm ios; ionic platform add ios;
}

bagdo-ionic-platform-reset () { #reset ios and android platform #

   echo -e "\033[38;5;148m Ionic Reset Platform iOS & Android \033[39m"
   echo "Executing: ionic platform rm ios; ionic platform add ios;"
   echo "Executing: ionic platform rm android; ionic platform add android;"

   ionic platform rm ios; ionic platform add ios;
   ionic platform rm android; ionic platform add android;
}

bagdo-ionic-build () { #builds ionic for ios and android #

   echo -e "\033[38;5;148m Ionic builds for IOS and Android \033[39m"
   echo "Executing: ionic build ios &"
   echo "Executing: ionic build android &"
   ionic build ios &
   ionic build android &
}

bagdo-ionic-open-xcode () { #open ionic ios xcode project#

   echo -e "\033[38;5;148m Opens Ionic iOS Xcode Project \033[39m"
   echo "Executing: cd platforms/ios;find . -name *.xcodeproj -type d -exec open -a Xcode {} \;cd ..."

   cd platforms/ios
   find . -name *.xcodeproj -type d -exec open -a Xcode {} \;
   cd ..
   cd ..
}

bagdo-ionic-run-android () { #runs ionic build android #

   echo -e "\033[38;5;148m Ionic runs Android \033[39m"
   echo "Executing: ionic run android --device"
   ionic run android --device
}

bagdo-ionic-run-ios () { #runs ionic build ios #

   echo -e "\033[38;5;148m Ionic runs iOS \033[39m"
   echo "Executing: ionic run iOS --device"
   echo "Note: Sometimes its necesary to run twice this command:/"
   ionic run ios --device
}

bagdo-ionic-run-developemnt-ios () { #runs ionic build ios #

   echo -e "\033[38;5;148m Ionic runs iOS \033[39m"
   echo "Executing: ionic run ios --device -l -c"
   echo "Note: Sometimes its necesary to run twice this command:/"
   ionic run ios --device -l -c
}

bagdo-ionic-open-apks () { #goto and open apks #

   echo -e "\033[38;5;148m Ionic Goto And Open apks \033[39m"
   echo "Executing: cd platforms/android/build/outputs/apk;open .;"

   cd platforms/android/build/outputs/apk
   open .
}

