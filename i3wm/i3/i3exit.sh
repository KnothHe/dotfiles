#!/bin/sh
lock() {
    # -b enable beeping
    # -t display the image tiled all over the screen
    # -e ignore empty password
    i3lock -e -b -t -i ~/Pictures/Wallpapers/lock.png
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
