#!/bin/bash


sudo chmod 700 ChiefCommander


for u in ArmyGeneral NavyMarshal AirForceChief
    do
    sudo chmod 700 $u
    sudo setfacl -m u:ChiefCommander:rwx -R ~$u
done


for j in Army{1..50}
    do
    sudo chmod 700 $j
    sudo setfacl -m u:ChiefCommander:rwx -R ~$u
    sudo setfacl -m u:ArmyGeneral:rwx -R ~$u
done
for j in Navy{1..50}
    do
    sudo chmod 700 $j
    sudo setfacl -m u:ChiefCommander:rwx -R ~$u
    sudo setfacl -m u:NavyMarshal:rwx -R ~$u
done
for j in AirForce{1..50}
    do
    sudo chmod 700 $j
    sudo setfacl -m u:ChiefCommander:rwx -R ~$u
    sudo setfacl -m u:AirForceChief:rwx -R ~$u
done
