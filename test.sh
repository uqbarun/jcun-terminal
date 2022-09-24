#!/bin/bash
for i in {1..20} 
do             
    sleep 0.5 && (tput cup 5 5; printf "$i\n")
done     

for i in {1..20} 
do             
    tput cup i 5
done     