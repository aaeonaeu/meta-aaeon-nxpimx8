#!/bin/bash

RS232=''

function RS232_test()
{


	gpioset 2 21=0
	gpioset 2 22=1
	gpioset 2 23=0
	gpioset 0 12=1

	
	
	
	echo "set ttymxc0 and ttymxc2 baud rate as 115200"
	stty -F /dev/ttymxc0 115200 raw            #CONFIGURE SERIAL PORT
	stty -F /dev/ttymxc2 115200 raw            #CONFIGURE SERIAL PORT
	
	#if [ -f ttyDumpMU0.dat ]; then
	#	rm ttyDumpMU0.dat
	#fi
	#if [ -f ttyDumpMU1.dat ]; then
	#	rm ttyDumpMU1.dat
	#fi
	
	echo "test ttymxc0 -> ttymxc2"
	exec 3</dev/ttymxc2                        #REDIRECT SERIAL OUTPUT TO FD 3
		cat <&3 > ttyDumpMU1.dat &            #REDIRECT SERIAL OUTPUT TO FILE
		PID=$!                                #SAVE PID TO KILL CAT
			echo "send-to-MU0" > /dev/ttymxc0  #SEND COMMAND STRING TO SERIAL PORT
			sleep 0.2s                        #WAIT FOR RESPONSE
		kill $PID                             #KILL CAT PROCESS
		wait $PID 2>/dev/null                 #SUPRESS "Terminated" output
	exec 3<&-                                 #FREE FD 3
	
	echo "test ttymxc2 -> ttymxc0"
	exec 3</dev/ttymxc0
	cat <&3 > ttyDumpMU0.dat &
		PID=$!
			echo "send-to-MU1" > /dev/ttymxc2
			sleep 0.2s
		kill $PID
		wait $PID 2>/dev/null
	exec 3<&-
	
	echo "===== DumpMU0 ====="
	cat ttyDumpMU0.dat                    #DUMP CAPTURED DATA
	echo "===== DumpMU1 ====="
	cat ttyDumpMU1.dat
	echo "==================="
	
	if [ `cat ttyDumpMU1.dat | grep -c send-to-MU0` -ne 1 ]; then
		echo "Exp-B RS232 fail - ttyMU0 -> ttyMU1"
		#, time	: `date`" >> $OUTFOLDER/exp-b.log
	fi
	
	if [ `cat ttyDumpMU0.dat | grep -c send-to-MU1` -ne 1 ]; then
		echo "Exp-B RS232 fail - ttyMU1 -> ttyMU0"
		#, time : `date`" >> $OUTFOLDER/exp-b.log
	fi
	
	if [ `cat ttyDumpMU1.dat | grep -c send-to-MU0` -eq 1 ]; then
		if [ `cat ttyDumpMU0.dat | grep -c send-to-MU1` -eq 1 ]; then
		echo "Exp-B RS232 success"
		#, time : `date`" >> $OUTFOLDER/exp-b.log
		RS232='Exp-B RS232 [pass]'
		else
			echo "Exp-B RS232 fail"
			#, time : `date`" >> $OUTFOLDER/exp-b.log
		RS232='Exp-B RS232 [fail]'
		fi
	else
		echo "Exp-B RS232 fail"
		#, time : `date`" >> $OUTFOLDER/exp-b.log
		RS232='Exp-B RS232 [fail]'
	fi
	echo -e "\n\n"	
}




RS232_test
echo $RS232



