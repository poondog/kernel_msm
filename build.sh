#!/bin/bash

BASE_VER="xx"
VER=""
KERNEL_VER=$BASE_VER$VER

# export LOCALVERSION="."`echo $KERNEL_VER`
export CROSS_COMPILE=${HOME}/Toolchains/arm-eabi-4.7/bin/arm-eabi-

export ARCH=arm
export SUBARCH=arm
export KBUILD_BUILD_USER=poondoge

DATE_START=$(date +"%s")

make "flo_defconfig"

echo "LOCALVERSION="$LOCALVERSION
echo "CROSS_COMPILE="$CROSS_COMPILE
echo "ARCH="$ARCH

make -j2

DATE_END=$(date +"%s")
echo
DIFF=$(($DATE_END - $DATE_START))
echo "  Build completed in $(($DIFF / 60)) minutes and $(($DIFF % 60)) seconds."
echo
