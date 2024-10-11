#@TYPE: Machine
#@NAME: aaeon-imx8mp-common

#@DESCRIPTION: Common machine configuration for IMX8MP AAEON products


require conf/machine/include/imx8mp-evk.inc


# kernel patches
EXTRA_KERNEL_PATCHES = " \
	file://0003-kernel-all.patch \
"


# u-boot patches
EXTRA_UBOOT_PATCHES = " \
  file://0003-uboot-all.patch \
"

# Set DDR FIRMWARE
DDR_FIRMWARE_VERSION = "_202006"
DDR_FIRMWARE_NAME = " \
        lpddr4_pmu_train_1d_imem${DDR_FIRMWARE_VERSION}.bin \
        lpddr4_pmu_train_1d_dmem${DDR_FIRMWARE_VERSION}.bin \
        lpddr4_pmu_train_2d_imem${DDR_FIRMWARE_VERSION}.bin \
        lpddr4_pmu_train_2d_dmem${DDR_FIRMWARE_VERSION}.bin \
"

# Set imx-mkimage boot target
IMXBOOT_TARGETS_BASENAME = "flash_evk"

# Set Serial console
SERIAL_CONSOLES = "115200;ttymxc2"

# imx-boot
IMAGE_BOOTLOADER = "imx-boot"
UBOOT_MAKE_TARGET = ""

# imx-atf
ATF_BOOT_UART_BASE = "0x30880000"

# wic
WIC_PARTITION_TABLE_TYPE = "msdos"
WIC_FSTAB_BLKDEV = "mmcblk2"
IMAGE_FSTYPES:append = " wic wic.md5sum"
WKS_FILE_DEPENDS:append = " imx-m7-demos"
IMAGE_BOOT_FILES += "imx8mp_m7_TCM_hello_world.bin \
                    imx8mp_m7_TCM_rpmsg_lite_pingpong_rtos_linux_remote.bin \
                    imx8mp_m7_TCM_rpmsg_lite_str_echo_rtos.bin \
                    imx8mp_m7_TCM_sai_low_power_audio.bin \
"