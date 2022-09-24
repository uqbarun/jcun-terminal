#!/bin/bash
source formatting.sh

function printLogo {
    local COLUMNS=$(tput cols)
    local text='\033[32mJC\033[34m@\033[32mUN:\033[00m~/22\033[34m#\033[0;37m_\033[0m'
    printf "$(printf '%*s' $(($COLUMNS / 2)))"
    re=$(printf '%*s' 6)
    re=${re// /'\b'}
    printf "${re}$(printf $text)\n"
    centerPad 9
    img2sixel ./images/isotipo.jpg
    printf '\n'
    printf '\n'
}

function printLogo2 {
    text=$(
        cat <<EOF

     __ __  
  __/ // /_ 
 /_  _  __/ 
/_  _  __/  
 /_//_/_____
     /_____/

EOF
    )

    local COLUMNS=$(tput cols)
    local re=$(printf '%*s' $((($COLUMNS - 15) / 2)))
    local text="${text//$'\n'/"\n$re"}"
    local width=$(tput cols)
    local height=$(tput lines)

    (
        sleep 2
        for i in {1..20}; do
            sleep 0.5 && (
                tput cup 5 5
                printf "$text\n"
            )
        done
    ) &
}

function printLogo3 {    
local text=$(cat <<EOF
        ###   ###             
       #+#   #+#              
   +#+#+#+#+#+#+#+            
     +#+   +:+                
 +#+#+#+#+#+#+#+              
   #+#   #+#                  
  ###   ###   
               ##########
EOF
    )
    local COL
    local ROW
    IFS=';' read -sdR -p $'\E[6n' ROW COL
    ROW="${ROW#*[}"
    local height=$(tput lines)
    local xOff=$(tput cols)
    xOff=$((($xOff / 2) - 9))
    local yOff=$((($height / 2)-5))
    #echo "$xOff $yOff"
    local x=$xOff
    local y=$yOff
    local i=0
    local t=0.25
    local c
    sleep 1
    for k in {1..5}; do        
        t=$( echo "($t / 0.5)" | bc )
        if [ $k -ge 5 ]; then
            #echo -e "\033[2J\033[?25l"
            #clear
            t=0
        fi        
        i=0
        
        while IFS= read -r line; do
            y=$((i + $yOff))
            if [ $y -ge $height ]; then
                printf "\n"
                yOff=$(($yOff - 1))
            fi        
            for ((j = 0; j < ${#line}; j++)); do
                sleep $t
                tput cup $y $x
                c="${line:$j:1}"
                if [[ $c = *[!\ ]* ]]; then
                    printf "\033[0;32m${c}\033[0m"
                fi                                
                #printf "$x $y"
                x=$((j + $xOff))
            done
            ((i += 1))
            
        done <<<"$text"        
    done    
    #printf "\n"
}
