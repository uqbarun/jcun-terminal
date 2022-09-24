#!/bin/bash
RED='\033[0;31m'
RED_BG='\033[41;30m'
GREEN='\033[0;32m'
GREEN_BG='\033[42;30m'
BLUE='\033[0;34m'
BLUE_BG='\033[44;30m'
WHITE='\033[0;37m'
NC='\033[0m' # No Color


function centerText {
    local COLUMNS=$(tput cols) 
    local text="$1"
    printf "$(printf '%*s' $(($COLUMNS/2)))"
    re=$(printf '%*s' $(((${#text}+2)/2)))
    re=${re// /'\b'}
    printf "${re}$(printf '\033[0;32m%s\033[42;30m%s\033[0;32m%s' '' "$text" '')\n\n"
}

function centerPad {
    COLUMNS=$(tput cols) 
    printf "%*s" $((($COLUMNS-$1)/2))
}

