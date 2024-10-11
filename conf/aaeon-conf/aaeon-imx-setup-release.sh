#!/bin/sh

CWD=$(pwd)
DISTRO_NAME="$DISTRO"
MACHINE_NAME="$MACHINE"
PROGNAME="$CWD/imx-setup-release.sh"

if [ -z "$BUILD" ]; then
	BUILD="build"
fi

MACHINE=$MACHINE DISTRO=$DISTRO BUILD_DIR=$BUILD source $PROGNAME $@

if [ -f ../sources/meta-aaeon-nxpimx8/conf/aaeon-conf/$MACHINE/bblayers.conf.append ]; then
	cat ../sources/meta-aaeon-nxpimx8/conf/aaeon-conf/$MACHINE/bblayers.conf.append >> ./conf/bblayers.conf
fi
if [ -f ../sources/meta-aaeon-nxpimx8/conf/aaeon-conf/$MACHINE/local.conf.append ]; then
	cat ../sources/meta-aaeon-nxpimx8/conf/aaeon-conf/$MACHINE/local.conf.append >> ./conf/local.conf
fi


