#!/bin/bash

FILE_PATH=`pwd`
SD_BOOT_PATH=`echo /media/$USER/boot`
SD_ROOT_PATH=`echo /media/$USER/root`

echo $SD_ROOT_PATH

if [ ! -d $SD_ROOT_PATH ]; then
    echo No find rfs on SDcard.
	exit
fi

sudo mkdir -p $SD_ROOT_PATH/home/srt/eeprom
sudo mkdir -p $SD_ROOT_PATH/opt/images/Debian/

sudo cp imx8mp_kirkstone_tool/m0cli $SD_ROOT_PATH/usr/sbin/
sudo chmod 755 $SD_ROOT_PATH/usr/sbin/m0cli
sudo cp imx8mp_kirkstone_tool/mdio-tool $SD_ROOT_PATH/usr/sbin/
sudo chmod 755 $SD_ROOT_PATH/usr/sbin/mdio-tool

sudo cp imx8mp_kirkstone_tool/imx8_plus_emmc_flasher.sh $SD_ROOT_PATH/usr/sbin/
sudo chmod 755 $SD_ROOT_PATH/usr/sbin/imx8_plus_emmc_flasher.sh
sudo cp imx8mp_kirkstone_tool/erase_emmc.sh $SD_ROOT_PATH/usr/sbin/
sudo chmod 755 $SD_ROOT_PATH/usr/sbin/erase_emmc.sh
sudo cp imx8mp_kirkstone_tool/sysbench $SD_ROOT_PATH/usr/sbin/
sudo chmod 755 $SD_ROOT_PATH/usr/sbin/sysbench
sudo cp imx8mp_kirkstone_tool/boot.scr $SD_ROOT_PATH/usr/sbin/
sudo chmod 755 $SD_ROOT_PATH/usr/sbin/boot.scr
sudo cp imx8mp_kirkstone_tool/issue $SD_ROOT_PATH/etc/issue
sudo chmod 755 $SD_ROOT_PATH/etc/issue
sudo cp imx8mp_kirkstone_tool/issue.net $SD_ROOT_PATH/etc/issue.net
sudo chmod 755 $SD_ROOT_PATH/etc/issue.net
sudo cp imx8mp_kirkstone_tool/os-release $SD_ROOT_PATH/etc/os-release
sudo chmod 755 $SD_ROOT_PATH/etc/os-release
sudo cp imx8mp_kirkstone_tool/modprobe.d/rtw_options.conf $SD_ROOT_PATH/etc/modprobe.d/
sudo chmod 755 $SD_ROOT_PATH/etc/modprobe.d/rtw_options.conf
sudo cp -r imx8mp_kirkstone_tool/quectel-cm $SD_ROOT_PATH/usr/sbin/
sudo chmod 755 $SD_ROOT_PATH/usr/sbin/quectel-cm

sudo cp imx8mp_kirkstone_tool/home/srt/eeprom/srgimx8cfg $SD_ROOT_PATH/home/srt/eeprom/
sudo chmod 755 $SD_ROOT_PATH/home/srt/eeprom/srgimx8cfg
sudo cp -r imx8mp_kirkstone_tool/rtl_bt $SD_ROOT_PATH/lib/firmware/
sudo cp -r imx8mp_kirkstone_tool/LoopTest $SD_ROOT_PATH


sudo cp -r imx8mp_kirkstone_tool/test $SD_ROOT_PATH

sudo cp imx8mp_service/ethernet.service $SD_ROOT_PATH/lib/systemd/system/
sudo chmod 755 $SD_ROOT_PATH/lib/systemd/system/ethernet.service
sudo cp imx8mp_service/gpio.service $SD_ROOT_PATH/lib/systemd/system/
sudo chmod 755 $SD_ROOT_PATH/lib/systemd/system/gpio.service
sudo cp imx8mp_service/watchdog.service $SD_ROOT_PATH/lib/systemd/system/
sudo chmod 755 $SD_ROOT_PATH/lib/systemd/system/watchdog.service
sudo cp imx8mp_service/setup_gpios.sh $SD_ROOT_PATH/usr/sbin/
sudo chmod 755 $SD_ROOT_PATH/usr/sbin/setup_gpios.sh
sudo cp imx8mp_service/watchdog.sh $SD_ROOT_PATH/usr/sbin/
sudo chmod 755 $SD_ROOT_PATH/usr/sbin/watchdog.sh
sudo cp imx8mp_service/lancfg.sh $SD_ROOT_PATH/usr/sbin/
sudo chmod 755 $SD_ROOT_PATH/usr/sbin/lancfg.sh

sync;sync;sync;

sudo ln -sf $SD_ROOT_PATH/lib/systemd/system/ethernet.service $SD_ROOT_PATH/lib/systemd/system/multi-user.target.wants/ethernet.service
sudo ln -sf $SD_ROOT_PATH/lib/systemd/system/gpio.service $SD_ROOT_PATH/lib/systemd/system/multi-user.target.wants/gpio.service
sudo ln -sf $SD_ROOT_PATH/lib/systemd/system/watchdog.service $SD_ROOT_PATH/lib/systemd/system/multi-user.target.wants/watchdog.service


