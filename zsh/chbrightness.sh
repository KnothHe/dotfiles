#!/usr/bin/env bash
# 一个用于调节屏幕亮度的脚本
max_brightness=852
min_brightness=5
if [[ "$USER" != "root" ]]; then
	echo "The program must be executed under the root user.";
	exit 0;
fi
value=$1;
expr $value &>/dev/null;
if [ $? -ne 0 ]; then
	echo "Input must be integer. Change brightness failed!!!"
	exit 0;
fi
if [ $value -ge $min_brightness ] && [ $value -le $max_brightness ]; then
	echo $value > /sys/class/backlight/intel_backlight/brightness
	echo "The brightness of the Computer has successfully changed ^_^"
	exit 0;
fi
echo "Input must be an integer betwwen 0 and 7500. Change brightness failed!!!";
exit 0;
