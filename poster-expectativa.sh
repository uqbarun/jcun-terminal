#!/bin/bash
PROMPT="\033[32mJC\033[34m@\033[32mUN:\033[00m$(dirs)\033[34m# \033[00m";
clear
printf "$PROMPT\n"
sleep 2
printf "Hola Neo\n" | pv -qL 20
sleep 1
printf "Despierta…\n" | pv -qL 10 
sleep 1

printf "$PROMPT\n"
sleep 1
printf "Sigue el conejo blanco" | pv -qL 10 
sleep 3
printf ". Toc, Toc.\n" | pv -qL 5 
printf "$PROMPT\n"
sleep 3
printf "\tEsperanos muy pronto\n" | pv -qL 10 
printf "\t" &&\
img2sixel ./isotipo.137x100.jpg 
sleep 3
printf "${PROMPT}"
sleep 2
printf "poweroff\n" | pv -qL 5 
printf "\033[41;30mERROR:\033[00m665"
sleep 1
printf "...\n" | pv -qL 1 

#echo -e "\033[2J\033[?25l"; 
R=`tput lines` C=`tput cols`;: $[R--] ; 
while true 
do ( e=echo\ -e s=sleep j=$[RANDOM%C] d=$[RANDOM%R];for i in `eval $e {1..$R}`;
do c=`printf '\\\\0%o' $[RANDOM%57+33]` 
### http://bruxy.regnet.cz/web/linux ###
$e "\033[$[i-1];${j}H\033[32m$c\033[$i;${j}H\033[37m"$c; $s 0.1;if [ $i -ge $d ]
then $e "\033[$[i-d];${j}H ";fi;done;for i in `eval $e {$[i-d]..$R}`; 
#[mat!rix]
do echo -e "\033[$i;${j}f ";$s 0.1;done)& sleep 0.05;done 
#(c) 2011 -- [ BruXy ]