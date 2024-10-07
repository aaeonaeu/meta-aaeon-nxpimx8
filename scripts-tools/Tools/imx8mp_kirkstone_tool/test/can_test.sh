#!/bin/bash

# --------------------------------------
# CAN test
# --------------------------------------
#return case list
CAN_TEST_PASS=0
TXT_DIFF_ERROR=1
CAN_TEST_FAIL=2

CAN_TEST_RESULT=$CAN_TEST_PASS

return_msg_str_list=\
"CAN_TEST_PASS \
TXT_DIFF_ERROR \
CAN_TEST_FAIL \
"
return_msg_str_list=($return_msg_str_list)

function save_error_num_log()
{
  [ $1 != 0 ] && CAN_TEST_RESULT=$CAN_TEST_FAIL
  #echo $1
  echo "$1" >> output/can/loop_${loop}_can.log
}

function save_text_log()
{
  #echo $@
  echo "$@" >> output/can/loop_${loop}_can.log
}

function CAN_TEST_main()
{
  mkdir -p output/can
  gpioset 1 13=0
  gpioset 1 14=0

  ip link set can0 down
  ip link set can0 type can bitrate 1000000
  ip link set can0 up

  ip link set can1 down
  ip link set can1 type can bitrate 1000000
  ip link set can1 up

  save_text_log "test can0 send to can1."

  candump can1 > can1.txt &

  sleep 0.5s

  cansend can0 111#1122334455667788
  
  sleep 0.5s
  
  TXT_CONTENT=$(cat "can1.txt")
  if [[ "$TXT_CONTENT" != "  can1  111   [8]  11 22 33 44 55 66 77 88" ]]; then
    save_text_log "$TXT_CONTENT" ; save_error_num_log $TXT_DIFF_ERROR
  fi

  can_pids=`pidof candump`
  for can_pid in $can_pids ; do
    echo "can_pid=$can_pid"
    kill -9 $can_pid
  done

  save_text_log "test can1 send to can0."

  candump can0 > can0.txt &

  sleep 0.5s

  cansend can1 111#8877665544332211
  
  sleep 0.5s
  
  TXT_CONTENT=$(cat "can0.txt")
  if [[ "$TXT_CONTENT" != "  can0  111   [8]  88 77 66 55 44 33 22 11" ]]; then
    save_text_log "$TXT_CONTENT" ; save_error_num_log $TXT_DIFF_ERROR
  fi

  rm can0.txt
  rm can1.txt

  can_pids=`pidof candump`
  for can_pid in $can_pids ; do
    echo "can_pid=$can_pid"
    kill -9 $can_pid
  done

  return $CAN_TEST_RESULT
}

loop=$1
CAN_TEST_main
RET_VALUE=$?
clear
save_text_log "[CAN_test.sh] ${return_msg_str_list[$RET_VALUE]}"

exit $RET_VALUE