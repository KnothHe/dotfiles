#!/bin/sh

# Check if xdo is installed
xdo_path=$(which xdo)
if [ $? -ne 0 ]; then
    echo "Cannot find \`xdo\` command." 1>&2
    exit 1
fi
# Obtain bar's window pid and id
all_pid=$(xdo pid -N "Polybar")
all_pid_len=${#all_pid}
pid=${all_pid:$((all_pid_len/2+1)):$((all_pid_len))}
all_id=$(xdo id -N "Polybar")
all_id_len=${#all_id}
id=${all_id:$((all_id_len/2+1)):$((all_id_len))}

# Toggle bar visibility
# if xprop -id $id | grep -q "Normal"; then
if xprop -id $id | grep -q "Normal"; then
#    xdo hide -N "Polybar"
    xdo hide -p $pid
else
    xdo show -p $pid
fi
