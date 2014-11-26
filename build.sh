#!/bin/bash

echo -e "\e[95m                                                      "
echo "        _   __                                        "
echo "       | | / /                                        "
echo "       | |/ /  __ _ _ __   __ _  __ _ _ __ ___   ___  "
echo "       |    \ / _' | '_ \ / _' |/ _' | '__/ _ \ / _ \ "
echo "       | |\  \ (_| | | | | (_| | (_| | | | (_) | (_) |"
echo "       \_| \_/\__,_|_| |_|\__, |\__,_|_|  \___/ \___/ "
echo "                           __/ |                      "
echo "                          |___/                          _,'  ___        "
echo "                    _   __                     _      <__\__/   \        "
echo "                   | | / /                    | |        \_  /  _\       "
echo "                   | |/ /  ___ _ __ _ __   ___| |           \,\ / \\     "
echo "                   |    \ / _ \ '__| '_ \ / _ \ |             //   \\    "
echo "                   | |\  \  __/ |  | | | |  __/ |           ,/'     '\_, "
echo "                   \_| \_/\___|_|  |_| |_|\___|_|   "
echo "                                                    "
echo -e "\033[0m                                                   "

VER="KANGAROO"

DATE_START=$(date +"%s")
export LOCALVERSION="-"`echo $VER`
export CROSS_COMPILE=${HOME}/Toolchains/arm-eabi-4.7/bin/arm-eabi-

export ARCH=arm
export SUBARCH=arm
export KBUILD_BUILD_USER=poondoge

make "flo_defconfig"

make -j2

DATE_END=$(date +"%s")
echo
DIFF=$(($DATE_END - $DATE_START))
if (( $(($DIFF / 60)) == 0 )); then
	echo "  Build completed in $(($DIFF % 60)) seconds."
elif (( $(($DIFF / 60)) == 1 )); then
	echo "  Build completed in $(($DIFF / 60)) minute and $(($DIFF % 60)) seconds."
else
	echo "  Build completed in $(($DIFF / 60)) minutes and $(($DIFF % 60)) seconds."
fi
echo
