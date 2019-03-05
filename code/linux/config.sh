#! /bin/bash

config="$HOME/.config/Code/User/settings.json"

if [ -e $config ]; then
    mv $config $config.orig
fi

cp settings.json $config

