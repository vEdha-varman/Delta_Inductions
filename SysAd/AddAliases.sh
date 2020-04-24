#!/bin/bash
# to add aliases


sudo updatedb


loc_file=$(locate UserManip.sh)
chmod 700 "$loc_file"
echo 'alias userGenerate='\"\\\"$loc_file\\\"\" >>~/.bashrc

loc_file=$(locate PermitManip.sh)
chmod 700 "$loc_file"
echo 'alias permit='\"\\\"$loc_file\\\"\" >>~/.bashrc

loc_file=$(locate PosManip.sh)
chmod 700 "$loc_file"
echo "0  0  * * * $user "\"\\\"$loc_file\\\"\" | sudo tee -a /etc/crontab >/dev/null 2>&1
echo 'alias autoSchedule='\"\\\"$loc_file\\\"\" >>~/.bashrc

loc_file=$(locate AttendManip.sh)
chmod 700 "$loc_file"
echo "0  6  * * * $user "\"\\\"$loc_file\\\"\" | sudo tee -a /etc/crontab >/dev/null 2>&1
echo 'alias attendance='\"\\\"$loc_file\\\"\" >>~/.bashrc


# source ~/.bashrc  # seems bash just didn't see this lie.n

user=$(whoami)

# echo "0  6  * * * $user finalattendance" | sudo tee -a /etc/crontab >/dev/null 2>&1
# echo "0  6  * * * $user nearest" | sudo tee -a /etc/crontab >/dev/null 2>&1
