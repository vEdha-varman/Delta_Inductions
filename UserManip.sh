#!/bin/bash


for u in ChiefCommander ArmyGeneral NavyMarshal AirForceChief
    do
    sudo useradd --create-home $u
    echo -e "toor$u\ntoor$u" | sudo passwd $u >/dev/null 2>&1
done

# ---- > for records to work
loc_file=$(locate RecordManip)
chmod 700 "$loc_file"
for u in ArmyGeneral NavyMarshal AirForceChief
	do
	sudo touch /home/$u/.BASHRC
	echo 'alias record='\"\\\"$loc_file\\\"\" | sudo tee -a /home/$u/.BASHRC >/dev/null 2>&1

	echo 'ENV=$HOME/.BASHRC; export ENV' | sudo tee -a /home/$u/.profile >/dev/null 2>&1
	
	sudo chmod 555 /home/$u/.BASHRC
	
	sudo setfacl -m u:$u:rx -R "$loc_file"
done
# ----


for g in Army Navy AirForce
    do
    sudo groupadd $g
    for n in {1..50}
        do
        sudo useradd --create-home -g $g $g$n
        echo -e "toor$g$n\ntoor$g$n" | sudo passwd $g$n >/dev/null 2>&1
    done
done

