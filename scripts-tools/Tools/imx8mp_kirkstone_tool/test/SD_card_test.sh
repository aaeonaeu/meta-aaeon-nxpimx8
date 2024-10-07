#!/bin/bash

SD=''

# --------------------------------------
# sd card test
# --------------------------------------
function SD_card_test()
{
	
	sd_string="This is a SD card test"
		
	if [ -e sdwrite.log ]; then
		rm -f sdwrite.log 2>/dev/null
	fi
	
	if [ -e sdtest1.txt ]; then
		rm -f sdtest1.txt 2>/dev/null
	fi
	
	if [ -e sdtest2.txt ]; then
		rm -f sdtest2.txt 2>/dev/null
	fi
	if [ -e sd_diff.log ]; then
		rm -f sd_diff.log 2>/dev/null
	fi
		
	eval sd_path=`lsblk | grep mmcblk1p2 | awk '{print $7}'`
	
	if [ ${sd_path} ]; then	
		dd if=/dev/zero of=$sd_path"/test/sdcard_write.bin" bs=1048576 count=1 oflag=direct 2>> sdwrite.log
		if [ `du -k $sd_path"/test/sdcard_write.bin" | awk '{print $1}'` -eq 1024 ]; then
			echo "SDcard Write success `date`"  >> sdwrite.log
			echo -e $sd_string >> sdtest1.txt
			cat sdtest1.txt  >> sdtest2.txt
			diff sdtest1.txt sdtest2.txt >> sd_diff.log
			
			if [ -s sd_diff.log ]; then
				SD="SD card [fail]"
			else
				SD="SD card [pass]"
			fi
		else
			echo "SDcard Write error `date`"  >> sdwrite.log
			SD="SD card [fail]" 
		fi
		
	else
		SD="SD card [not plug in]"
	fi
	

}


SD_card_test

echo $SD



