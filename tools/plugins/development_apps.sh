#!/bin/bash

#Development Extra apps
alias "st"="open -a SourceTree . "
alias "subl"="open -a 'Sublime Text'"

function chrome(){ open -a "Google Chrome" "$*" }


#http://twobitlabs.com/2011/08/install-diffmerge-git-mac-os-x/
# git difftool Build-54..Build-55 file.m
# To resolve merge conflicts, just run git mergetool:
# git mergetool

bagdo-git-difftool () { #This method will run a git difftool using your favorite diffmerge app#

    echo -e "\033[38;5;148m Git Difftool agains 2 branches \033[39m"

    echo -e "\033[38;5;148m 1 arg = $1  is the name a file or branch name   \033[39m "

    echo -e "\033[38;5;148m 2 arg = $2  is the name a file2 or branch2 name   \033[39m "

    echo -e "\033[38;5;148m git difftool $1 $2   \033[39m "

    git difftool $1 $2
}
