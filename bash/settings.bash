export VISUAL=vim
export EDITOR=vim

# setting lf
export PATH="$HOME/.local/bin:$PATH"
LFCD="$HOME/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi
bind '"\C-o":"lfcd\C-m"'
