#!/bin/bash

for FILE in '.profile'; do
    if [ -e "$HOME/$FILE" ]; then
        if grep -q '^source ~/.append' "$HOME/$FILE"; then
            echo 'source has been added.'
        else
            echo -en "\nsource ~/.append/$FILE" >> "$HOME/$FILE"
        fi
    fi
done
