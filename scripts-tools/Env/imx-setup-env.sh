#!/bin/sh

sudo cp file/bblayers.conf ../../../../imx8p_build/conf/bblayers.conf
sudo cp file/local.conf ../../../../imx8p_build/conf/local.conf
sudo cp file/imx-setup-release.sh ../../../../imx-setup-release.sh

sync;sync;sync;
