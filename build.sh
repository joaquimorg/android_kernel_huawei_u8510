#!/bin/bash -x
CYANOGENMOD=../../..

# Make mrproper
#make mrproper

# Set config
make hw_u8510_defconfig
#make menuconfig

# Make modules
nice -n 10 make -j2 modules

# Copy modules
find -name '*.ko' -exec cp -av {} $CYANOGENMOD/device/huawei/u8510/kernel/modules/ \;

# Build kernel
nice -n 10 make -j2 zImage
# Copy kernel
cp arch/arm/boot/zImage $CYANOGENMOD/device/huawei/u8510/kernel/kernel

# Make mrproper
#make mrproper

