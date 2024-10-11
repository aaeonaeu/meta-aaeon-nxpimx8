#!/bin/bash

aaeon_mac="00:07:32"

declare -u mac0=$(sudo ifconfig -a eth0 | awk '/ether/ { print $2 }')
declare -u mac1=$(sudo ifconfig -a eth1 | awk '/ether/ { print $2 }')

new_eth0=$(/home/srt/eeprom/srgimx8cfg -0 )
new_eth1=$(/home/srt/eeprom/srgimx8cfg -1 )

echo -e "\n\n"
echo "eth0 mac address : ${mac0}"
echo "eth1 mac address : ${mac1}"
echo -e "new_eth0=${new_eth0}"
echo -e "new_eth1=${new_eth1}"
echo -e "\n\n" 



if [ "$new_eth0" != "$mac0" ]; then
	echo "[fail]"
	echo "The new eth0 mac address value is wrong... "
elif [ "$new_eth1" != "$mac1" ]; then
	echo "[fail]"
	echo "The new eth1 mac address value is wrong... "
else
	echo "[pass]"
fi

