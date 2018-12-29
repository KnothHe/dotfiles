#!/usr/bin/env bash

case $1 in
    start)
        # Terminate already running bar instances
        killall -q polybar

        # Wait until the processes have been shut down
        while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

        # Launch top bar
        polybar top &
        ;;
    top)
        if [ -z $(xdo pid -a "polybar-top_eDP1") ]; then
            # Launch top bar
            polybar top &
        else
            polybar-msg -p $(xdo pid -a "polybar-top_eDP1") cmd toggle 
        fi
    ;;
    bottom)
        if [ -z $(xdo pid -a "polybar-bottom_eDP1") ]; then
            # Launch bottom bar
            polybar bottom &
        else 
            polybar-msg -p $(xdo pid -a "polybar-bottom_eDP1") cmd toggle 
        fi
    ;;
    show)
        if [ -z $(xdo pid -a "polybar-bottom_eDP1") ] \
            && [ -z $(xdo pid -a "polybar-top_eDP1") ]; then
            # Terminate already running bar instances
            killall -q polybar

            # Wait until the processes have been shut down
            while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

            # Launch top bar
            polybar bottom &
            polybar top &
        elif [ -z $(xdo pid -a "polybar-bottom_eDP1") ]; then
            # Launch bottom bar
            polybar bottom &
        elif [ -z $(xdo pid -a "polybar-top_eDP1") ]; then
            # Launch top bar
            polybar top &
        fi
    ;;
    hide)
        polybar-msg cmd hide
    ;;
    restart)
        # Terminate already running bar instances
        killall -q polybar

        # Wait until the processes have been shut down
        while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

        # Launch top bar and bottom bar
        polybar bottom &
        polybar top &
    ;;
esac

