#!/bin/bash
# 1er parametro: Milisegundos de duración del efecto
function matrix {
R=`tput lines` C=`tput cols`;: $[R--] ; 
counter=0
while [ $counter -lt $1 ]
do 
( 
    e=echo\ -e s=sleep j=$[RANDOM%C] d=$[RANDOM%R];
    for i in `eval $e {1..$R}`; do 
        c=`printf '\\\\0%o' $[RANDOM%57+33]` 
        $e "\033[$[i-1];${j}H\033[32m$c\033[$i;${j}H\033[37m"$c; $s 0.05;
        if [ $i -ge $d ]
            then $e "\033[$[i-d];${j}H ";
        fi;
    done;
    for i in `eval $e {$[i-d]..$R}`; do echo -e "\033[$i;${j}f ";$s 0.05;done
) & sleep 0.025;
counter=$(( $counter + 50))
done 

}

#matrix 4000 2>/dev/null
