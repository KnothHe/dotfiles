#!/bin/sh
lock() {
# depend on scort, imageMagick and i3lock
    lock_img="/tmp/lockscreen.png"
    scrot -q 50 -d 1 -o $lock_img
    convert -paint 3 $lock_img $lock_img
    i3lock -b --ignore-empty-password -i $lock_img -f

# depend on lightdm
#    dm-tool switch-to-greeter
}

case "$1" in
    lock)
        lock
        ;;
    logout)
        i3-msg exit
        ;;
    suspend)
        lock && systemctl suspend
        ;;
    hibernate)
        lock && systemctl hibernate
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
        exit 2
esac

exit 0
