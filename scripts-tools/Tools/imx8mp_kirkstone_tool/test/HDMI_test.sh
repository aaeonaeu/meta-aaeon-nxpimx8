#!/bin/bash

function HDMI_test()
{
 	if [ -e  hdmi.log ]; then
		 rm -f hdmi.log 2>/dev/null
	fi

	./modetest -c
}

HDMI_test
