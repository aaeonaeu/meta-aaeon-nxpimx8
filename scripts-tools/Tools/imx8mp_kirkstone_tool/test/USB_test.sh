#!/bin/bash

# --------------------------------------
# usb test
# --------------------------------------

tmp1=usb_test.txt

eval usb_path=`df | grep sda | awk '{print $6}'`
if [ ${usb_path} ]; then
	if [ -e $tmp1 ]; then
		rm -f $tmp1 2>/dev/null
	fi
	
	if [ -e usbwrite.log ]; then
		rm -f usbwrite.log 2>/dev/null
	fi

	dd if=/dev/zero of=$usb_path"/usb_write.bin" bs=1048576 count=50 oflag=direct 2>> usbwrite.log
	if [ `du -k $usb_path"/usb_write.bin" | awk '{print $1}'` -eq 51200 ]; then
		echo "USB /dev/sda Write success `date`"  >> usbwrite.log
		echo -e "This is a USB test" >> usb_test.txt
		
		tmp2=$usb_path"/usb_test.txt"
		
		cp $tmp1 $tmp2
		
		if [ -e usb_diff.log ]; then
			rm -f usb_diff.log 2>/dev/null
		fi
		
		if [ -e $tmp2 ]; then
			diff $tmp1 $tmp2 > usb_diff.log
			if [ -s usb_diff.log ]; then
				USB="USB [fail]"
			else
				USB="USB [pass]"
			fi
		else
			USB="USB [fail]"
		fi
	else
		echo "USB /dev/sda write error `date`" >> usbwrite.log
		USB="USB [fail]"
	fi
else
	USB="USB [fail]"	
fi

echo $USB
