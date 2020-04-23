#!/bin/bash
# to add aliases

echo "alias userGenerate='chmod +x ./UserManip.sh; ./UserManip.sh'" >>~/.bashrc
echo "alias permit='chmod +x ./PermitManip.sh; ./PermitManip.sh'" >>~/.bashrc
echo "alias autoSchedule='chmod +x ./PosManip.sh; ./PosManip.sh'" >>~/.bashrc
echo "alias attendance='chmod +x ./AttendManip.sh; ./AttendManip.sh'" >>~/.bashrc
echo "alias record='chmod +x ./RecordManip.sh; ./RecordManip.sh'" >>~/.bashrc

source ~/.bashrc
