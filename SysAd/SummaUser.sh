#!/bin/bash
# to remove UserManip effects

for u in ChiefCommander ArmyGeneral NavyMarshal AirForceChief
    do
    sudo userdel --remove $u
done


for g in Army Navy AirForce
    do
    for n in {1..50}
        do
        sudo userdel --remove $g$n
    done
    sudo groupdel $g
done
