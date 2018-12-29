#!/bin/sh

# Check if xdo is installed
xdo_path=$(which xdo)
if [ $? -ne 0 ]; then
    echo "Cannot find \`xdo\` command." 1>&2
    exit 1
fi

# Obtain top and bottom bar's window pid and id
top_id=$(xdo id -a "polybar-top_eDP1")
bottom_id=$(xdo id -a "polybar-bottom_eDP1")
top_pid=$(xdo pid -a "polybar-top_eDP1")
bottom_pid=$(xdo pid -a "polybar-bottom_eDP1")

function toggle {
# Toggle bar visibility
# $1 is $id
# $2 is $pid
    if xprop -id $1 | grep -q "Normal"; then
        xdo hide -p $2
    else
        xdo show -p $2
    fi
}

function show {
    polybar-msg cmd restart
}

function hide {
    polybar-msg cmd hide
}

case $1 in
    all_show)
        show
        ;;
    all_hide)
        hide $top_id $top_pid
        hide $bottom_id $bottom_pid
        ;;
    top)
        toggle $top_id $top_pid
        ;;
    bottom)
        toggle $bottom_id $bottom_pid
        ;;
    *)
        echo "Do nothing"
        ;;
esac
