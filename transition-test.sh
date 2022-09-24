#!/bin/bash
source print-logo.sh
source matrix-effect.sh
height=$(tput lines)
re=$(printf '%*s' $height)
re=${re// /'x'\\n}
printf "${re}"    
printLogo
sleep 1
printLogo3 &
matrix 6000 2>/dev/null
sleep 6