#!/bin/bash


Date=$(date +"%F")

sudo touch /home/ArmyGeneral/attendance_record.txt
echo "$Date:" | sudo tee -a /home/ArmyGeneral/attendance_record.txt
grep -i "$Date.* Army" attendance.log | awk '{if ( $3 == "YES" ) print $2}' | sudo tee -a /home/ArmyGeneral/attendance_record.txt

sudo touch /home/NavyMarshal/attendance_record.txt
echo "$Date:" | sudo tee -a /home/NavyMarshal/attendance_record.txt
grep -i "$Date.* Navy" attendance.log | awk '{if ( $3 == "YES" ) print $2}' | sudo tee -a /home/NavyMarshal/attendance_record.txt

sudo touch /home/AirForceChief/attendance_record.txt
echo "$Date:" | sudo tee -a /home/AirForceChief/attendance_record.txt
grep -i "$Date.* AirForce" attendance.log | awk '{if ( $3 == "YES" ) print $2}' | sudo tee -a /home/AirForceChief/attendance_record.txt
