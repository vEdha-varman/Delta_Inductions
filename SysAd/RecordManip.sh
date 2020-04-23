#!/bin/bash

# if [[ $#==0 ]]; then echo "Enter a no. in [1-7]: ";
# else

tdow=$(date +"%u")
dow=$((7+$tdow - $1))

Date=$(date -I -d "-$dow day")


user=$(whoami)

echo -e "\n$Date:"
if [ "$user" == "ArmyGeneral" ]
then
	grep -i "$Date.* Army" attendance.log | awk '{print "\t"$2,$3}'
elif [ "$user" == "NavyMarshal" ]
then
	grep -i "$Date.* Navy" attendance.log | awk '{print "\t"$2,$3}'
elif [ "$user" == "AirForceChief" ]
then
	grep -i "$Date.* AirForce" attendance.log | awk '{print "\t"$2,$3}'
else
	echo "Invalid User $user"
fi

# fi
