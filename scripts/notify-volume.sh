icon_path="/usr/share/icons/Papirus-Dark/16x16/devices/audio-input-microphone.svg"
        
case $1 in
    change)
        notify-send -i $icon_path \
            "Lift  $(amixer sget Master | sed -n 6p | cut -d' ' -f7)" \
            "Right $(amixer sget Master | sed -n 7p | cut -d' ' -f7)"
    ;;
    toggle)
        notify-send -i $icon_path \
            "Lift  $(amixer sget Master | sed -n 6p | cut -d' ' -f8)" \
            "Right $(amixer sget Master | sed -n 7p | cut -d' ' -f8)"
    ;;
    *)
        echo "Do nothing"
    ;;
esac
 
