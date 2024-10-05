#!/bin/sh

cp file/bblayers.conf ../../../../imx8p_build/conf/bblayers.conf
cp file/local.conf ../../../../imx8p_build/conf/local.conf
cp file/imx-setup-release.sh ../../../../imx-setup-release.sh

sync;sync;sync;
