#!/bin/bash
# To inform Schedule to soldiers

Date=$(date +"%F")
for g in Army Navy AirForce
    do
    for u in {1..50}
        do
        n=$(sudo ls /home/$g$u | grep -c 'position_allotted.txt')
        sudo touch /home/$g$u/position_allotted.txt
		if [[ $n -eq 0 ]]
		then
        	echo "Date       Post" | sudo tee -a /home/$g$u/position_allotted.txt
        fi
        pos=$(grep -i "$Date.* $g$u " position.log | awk '{print $3,$4}')
        echo "$Date $pos" | sudo tee -a /home/$g$u/position_allotted.txt
    done
done
