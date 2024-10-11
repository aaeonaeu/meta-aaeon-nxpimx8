#!/bin/sh
#
# i.MX Yocto Project Build Environment Setup Script
#
# Copyright (C) 2011-2016 Freescale Semiconductor
# Copyright 2017 NXP
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

CWD=$(pwd)
DISTRO_NAME="$DISTRO"
MACHINE_NAME="$MACHINE"
PROGNAME="$CWD/imx-setup-release.sh"

if [ -z "$BUILD" ]; then
	BUILD="build"
fi

MACHINE=$MACHINE DISTRO=$DISTRO BUILD_DIR=$BUILD source $PROGNAME $@

if [ -f ../sources/meta-aaeon-nxpimx8/conf/adlink-conf/$MACHINE/bblayers.conf.append ]; then
	cat ../sources/meta-aaeon-nxpimx8/conf/adlink-conf/$MACHINE/bblayers.conf.append >> ./conf/bblayers.conf
fi
if [ -f ../sources/meta-aaeon-nxpimx8/conf/adlink-conf/$MACHINE/local.conf.append ]; then
	cat ../sources/meta-aaeon-nxpimx8/conf/adlink-conf/$MACHINE/local.conf.append >> ./conf/local.conf
fi

