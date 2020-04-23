#!/bin/bash

Date=$(date +"%F")

for g in Army Navy AirForce
sudo cd ~ArmyGeneral
for n in {1..50}
    do
    sudo echo "Date Post" > position_alloted.txt
    pos=$(grep -i "$Date.* $g$n " position.log | awk '{print $3,$4}')
    sudo echo "$Date $pos" >> position_alloted.txt
done