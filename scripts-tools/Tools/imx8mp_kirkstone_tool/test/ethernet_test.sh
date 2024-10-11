#!/bin/bash

LAN1='LAN1 [fail]'
LAN2='LAN2 [fail]'
ETH0_IP=''
ETH1_IP=''





# --------------------------------------
# ethernet test
# --------------------------------------
function  ethernet_test()
{

eval ETH0_IP=`ifconfig eth0 | grep 'inet6' | head -n 1 | awk '{print $2}'`
eval ETH1_IP=`ifconfig eth1 | grep 'inet6' |  head -n 1 |awk '{print $2}'`


	if [ "${ETH1_IP}" != "${ETH0_IP}" ];then
		ping -I eth0 $ETH1_IP -c 4 >> eth0.log
		if [ $? -ne 0 ]; then
			LAN1='LAN1 [fail]'
			echo "eth0 ping $HOSTIP error, time : `date`" >> eth0.log
			flag=1
		else
			LAN1='LAN1 [pass]'
			echo "eth0 ping $HOSTIP success, time : `date`" >> eth0.log 
		fi

		ping -I eth1 $ETH0_IP -c 4 >> eth1.log
		if [ $? -ne 0 ]; then
			LAN2='LAN2 [fail]'
			echo "eth1 ping $HOSTIP error, time : `date`" >> eth1.log
			flag=1
		else
			LAN2='LAN2 [pass]'
			echo "eth1 ping $HOSTIP success, time : `date`" >> eth1.log
		fi
	fi
}


ethernet_test

echo $LAN1
echo $LAN2




