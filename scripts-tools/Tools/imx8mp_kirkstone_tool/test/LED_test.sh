#!/bin/bash

function LED_OFF()
{

        for i in {1..7}
        do
                m0cli -c 0 -i $i -v 0
        done
}
function LED_ON()
{

        for i in {1..7}
        do
                m0cli -c 0 -i $i -v 1
                sleep 0.5
        done

}

LED_OFF
LED_ON
