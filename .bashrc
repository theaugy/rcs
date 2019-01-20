# .bashrc
PATH="$HOME/bin:$HOME/g/scale-scripts/bin:$PATH"

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
set -o vi
export TERMINAL=gnome-terminal
export EDITOR=vimx

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export MANPATH="$MANPATH:$HOME/man"
export MANSECT="1:n:l:8:3:2:3posix:3pm:3perl:5:4:9:6:7:my"

# sc build stuff (for jane's fancy scripts)
export SC_BUILDVM_HOSTNAME=buildvm
export SC_GIT_USER=astclair
export SC_GIT_ROOT=/home/astclair/sc/scale-product
export SC_SRC_ROOT=/local/scale-product
export SC_SCREWI_USER=astclair

export PS1="\[\e[32m\]\$HOSTNAME \[\e[1m\]\W $ \[\e[0m\]"
