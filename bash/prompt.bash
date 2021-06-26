bold='\[\033[01;1m\]'
reset='\[\033[00m\]'
default='\[\033[01;39m\]'
black='\[\033[01;30m\]'
red='\[\033[01;31m\]'
green='\[\033[01;32m\]'
yellow='\[\033[01;33m\]'
blue='\[\033[01;34m\]'
magenta='\[\033[01;35m\]'
cyan='\[\033[01;36m\]'
white='\[\033[01;37m\]'

PROMPT_DIRTRIM=3
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1="${debian_chroot:+($debian_chroot)}${green}\u@\h${reset}:${blue}\w${cyan}$(parse_git_branch)${reset}\$ "
