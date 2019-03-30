#!/bin/bash

# if config directory is not exist, creat this directory.
# if config file has already exist, rename it as origName.orgi.
# finally create softlink of config file.
function softlink {
    local cfgFile="$cfgDir/$cfgName"
    if [ -e $cfgFile -a ! -L $cfgFile ]; then
        mv $cfgFile $cfgFile.orgi
    fi
    if [ ! -d $cfgDir ]; then
        mkdir -p $cfgDir
    elif [ -L $cfgFile ]; then
        rm $cfgFile
    fi

    ln -s $dotFile $cfgFile

    return 0
}

cfgDirs=(   \
            "$HOME" \
)

cfgNames=(  
            ".tmux.conf" \
)

dotFiles=(  \
            "tmux/tmux.conf" \
)

for i in "${!cfgDirs[@]}";
do
    cfgDir="${cfgDirs[$i]}"
    cfgName="${cfgNames[$i]}"
    dotFile="$(pwd)/${dotFiles[$i]}"

    softlink

    echo -en "\E[41m\E[37m$cfgDir/$cfgName\E(B\E[m"
    echo -en "\E[32m and \E(B\E[m"
    echo -en "\E[43m\E[30m$dotFile\E(B\E[m"
    echo ""
done
