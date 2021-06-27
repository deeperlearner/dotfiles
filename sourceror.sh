#!/bin/bash

Append () {
    if [ -e "$HOME/$FILE" ]; then
        if grep -q "^$1 ~/${FILE}.d/*" "$HOME/$FILE"; then
            echo "$1 has already been added."
        else
            echo -en "\n$1 ~/${FILE}.d/*" >> "$HOME/$FILE"
        fi
    else
        echo "File $HOME/$FILE does not exist. Create a new one."
        echo -en "\n$1 ~/${FILE}.d/*" >> "$HOME/$FILE"
    fi
}

for FILE in .bashrc .profile
do
    Append "source"
done
for FILE in .ssh/config
do
    Append "Include"
done
