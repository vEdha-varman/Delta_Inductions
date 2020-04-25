#!/bin/bash


for u in ChiefCommander ArmyGeneral NavyMarshal AirForceChief
    do
    sudo useradd --create-home $u
    echo -e "toor$u\ntoor$u" | sudo passwd $u >/dev/null 2>&1
done


for g in Army Navy AirForce
    do
    sudo groupadd $g
    for n in {1..50}
        do
        sudo useradd --create-home -g $g $g$n
        echo -e "toor$g$n\ntoor$g$n" | sudo passwd $g$n >/dev/null 2>&1
    done
done

