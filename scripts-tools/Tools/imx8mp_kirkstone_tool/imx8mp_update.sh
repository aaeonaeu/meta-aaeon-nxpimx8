#!/bin/bash

mkdir -p /home/srt/eeprom
mkdir -p /opt/images/Debian/

cp /run/media/KING-sda1/imx8mp_kirkstone_tool/m0cli /usr/sbin/
cp /run/media/KING-sda1/imx8mp_kirkstone_tool/mdio-tool /usr/sbin/

cp /run/media/KING-sda1/imx8mp_kirkstone_tool/imx8_plus_emmc_flasher.sh /usr/sbin/
cp /run/media/KING-sda1/imx8mp_kirkstone_tool/erase_emmc.sh /usr/sbin/
cp /run/media/KING-sda1/imx8mp_kirkstone_tool/sysbench /usr/sbin/
cp /run/media/KING-sda1/imx8mp_kirkstone_tool/boot.scr /usr/sbin/
cp /run/media/KING-sda1/imx8mp_kirkstone_tool/issue /etc/issue
cp /run/media/KING-sda1/imx8mp_kirkstone_tool/issue.net /etc/issue.net
cp /run/media/KING-sda1/imx8mp_kirkstone_tool/os-release /etc/os-release
cp /run/media/KING-sda1/imx8mp_kirkstone_tool/modprobe.d/rtw_options.conf /etc/modprobe.d/
cp -r /run/media/KING-sda1/imx8mp_kirkstone_tool/quectel-cm /usr/sbin/



cp /run/media/KING-sda1/imx8mp_kirkstone_tool/home/srt/eeprom/srgimx8cfg /home/srt/eeprom/
cp -r /run/media/KING-sda1/imx8mp_kirkstone_tool/rtl_bt /lib/firmware/
cp -r /run/media/KING-sda1/imx8mp_kirkstone_tool/LoopTest /


cd /
cp -r /run/media/KING-sda1/imx8mp_kirkstone_tool/test .

cp /run/media/KING-sda1/imx8mp_service/ethernet.service /lib/systemd/system/
cp /run/media/KING-sda1/imx8mp_service/gpio.service /lib/systemd/system/
cp /run/media/KING-sda1/imx8mp_service/watchdog.service /lib/systemd/system/
cp /run/media/KING-sda1/imx8mp_service/setup_gpios.sh /usr/sbin/
cp /run/media/KING-sda1/imx8mp_service/watchdog.sh /usr/sbin/
cp /run/media/KING-sda1/imx8mp_service/lancfg.sh /usr/sbin/

sleep 0.5
systemctl enable ethernet.service
sleep 0.5
systemctl enable gpio.service
sleep 0.5
systemctl enable watchdog.service

