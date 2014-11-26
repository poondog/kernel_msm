#!/bin/bash

VER="KANGAROO"

export LOCALVERSION="-"`echo $VER`
export CROSS_COMPILE=${HOME}/Toolchains/arm-eabi-4.7/bin/arm-eabi-

export ARCH=arm
export SUBARCH=arm
export KBUILD_BUILD_USER=poondoge

DATE_START=$(date +"%s")

echo -e "\e[93m                                                      "
echo -e "\e[93m        _   __                                        "
echo -e "\e[93m       | | / /                                        "
echo -e "\e[93m       | |/ /  __ _ _ __   __ _  __ _ _ __ ___   ___  "
echo -e "\e[93m       |    \ / _' | '_ \ / _' |/ _' | '__/ _ \ / _ \ "
echo -e "\e[93m       | |\  \ (_| | | | | (_| | (_| | | | (_) | (_) |"
echo -e "\e[93m       \_| \_/\__,_|_| |_|\__, |\__,_|_|  \___/ \___/ "
echo -e "\e[93m                           __/ |                      "
echo -e "\e[93m                          |___/                       "
echo -e "\e[93m                     _   __                     _   "
echo -e "\e[93m                    | | / /                    | |  "
echo -e "\e[93m                    | |/ /  ___ _ __ _ __   ___| |  "
echo -e "\e[93m                    |    \ / _ \ '__| '_ \ / _ \ |  "
echo -e "\e[93m                    | |\  \  __/ |  | | | |  __/ |  "
echo -e "\e[93m                    \_| \_/\___|_|  |_| |_|\___|_|  "
echo -e "\e[93m                                                    "
echo -e "\033[0m                                                   "

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
