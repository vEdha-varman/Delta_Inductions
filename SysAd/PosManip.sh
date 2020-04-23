#!/bin/bash

Date=$(date +"%F")
for g in Army Navy AirForce
    do
    for n in {1..50}
        do
        sudo cd ~$g$n
        sudo echo "Date Post" > position_alloted.txt
        pos=$(grep -i "$Date.* $g$n " position.log | awk '{print $3,$4}')
        sudo echo "$Date $pos" >> position_alloted.txt
    done
done