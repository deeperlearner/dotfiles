#!/bin/bash

Append () {
    if [ -e "$HOME/$FILE" ]; then
        if grep -q "$1" "$HOME/$FILE"; then
            echo "Append done."
        else
            echo -en "\n$1" >> "$HOME/$FILE"
        fi
    else
        echo "File $HOME/$FILE does not exist. Create a new one."
        echo -en "\n$1" >> "$HOME/$FILE"
    fi
}

for FILE in .bashrc .profile
do
    Append "source ~/${FILE}.d/${FILE}_global"
done
