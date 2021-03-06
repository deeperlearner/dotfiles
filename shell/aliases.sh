alias python='python3.7'
alias pip='python3.7 -m pip'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias watch_nv='watch -n 1 nvidia-smi'
alias view_history='less /var/log/apt/history.log'
alias rr='. ranger'
alias lh='ls -lh'

# show each submodules ahead or behind commits
gss_command='git -c color.status=always status -s | \
             sed "s/^\(.*\)/\t\1/g" && git branch -v | \
             grep -E "ahead|behind" | \
             sed -r "s/[ *]\s(\S*).*(\[(ahead|behind).+?\]).*/\t\1 \2/g"'
alias gs="git rev-parse --show-toplevel && \
          $gss_command && \
          git submodule foreach --recursive '$gss_command'"
