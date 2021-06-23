#!/bin/bash

for FILE in .bashrc .profile
do
    if [ -e "$HOME/$FILE" ]; then
        if grep -q "^source ~/${FILE}_global" "$HOME/$FILE"; then
            echo 'Source has already been added.'
        else
            echo -en "\nsource ~/${FILE}_global" >> "$HOME/$FILE"
        fi
    else
        echo "File $HOME/$FILE does not exist. Create a new one."
        echo -en "\nsource ~/${FILE}_global" >> "$HOME/$FILE"
    fi
done
