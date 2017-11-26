##########################
# boilerplate
#

#if [ -z "$SSH_AUTH_SOCK" ] && command -v ssh-agent > /dev/null 2>&1; then
   #echo "Starting ssh-agent..."
   #eval $(ssh-agent);
#fi

# If not running interactively, don't do anything else
[[ "$-" != *i* ]] && return

if [[ "$HOSTNAME" == "zen" ]]; then
   eval `keychain --quiet --eval --agents ssh id_rsa`
   (date && xinput set-prop 13 "libinput Tapping Enabled" 1) &>> ~/.log/xinput_set_pop
   (date && xinput set-prop 13 "libinput Accel Speed" .1) &>> ~/.log/xinput_set_pop
fi

function hascmd() {
if hash "$1" > /dev/null 2>&1; then
   return 0;
else
   return 1
fi
}

if [ -z "$(pidof xbindkeys)" ] && hascmd xbindkeys; then
   xbindkeys &> /dev/null
fi

##########################
# Vars, aliases, options
#
alias ls="ls --color -lGh"
export MYBIN="$HOME/bin"
set -o vi
export EDITOR=vim
export CDP_SOUND_EXT=wav
PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH

# good for looking at changes between commits in beyondcompare
alias gdd="git difftool --dir-diff --no-symlinks";
##########################

##########################
# Prompt
#

# handy for PS1
parse_git_branch() {
       git branch 3> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

function shellcmd_timer_start {
  shellcmd_timer=${shellcmd_timer:-$SECONDS}
}

function shellcmd_timer_stop {
  shellcmd_timer_show=$(($SECONDS - $shellcmd_timer))
  unset shellcmd_timer
}

function augy_prompt_command {
    shellcmd_exit=$?;
    if [ "$(id -u)" -ne 0 ]; then
        echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.log/bash-history-$(date "+%Y-%m-%d").log;
    fi

    # PS1 colors need \[ \] around the color code chars
    local RCol='\[\e[0m\]'
    local Red='\[\e[0;31m\]'
    local Gre='\[\e[0;32m\]'
    local BYel='\[\e[1;33m\]'
    local BBlu='\[\e[1;34m\]'
    local Pur='\[\e[0;35m\]'

    # command versions don't need the extra \[ \]
    local C_RCol='\e[0m'
    local C_Red='\e[0;31m'
    local C_Gre='\e[0;32m'
    local C_BYel='\e[1;33m'
    local C_BBlu='\e[1;34m'
    local C_Pur='\e[0;35m'

    local terminal_non_bold="\[$(tput sgr0)\[\e[41m\]"
    local command_non_bold="$(tput sgr0)\e[41m"

    local exit_code_color="${BYel}"
    local command_exit_code_color="${C_BYel}"
    [ "$shellcmd_exit" == "0" ] && exit_code_color="${BBlu}" && command_exit_color="${C_BBlu}"

    echo -e $command_non_bold"$PWD $(tput bold)@$HOSTNAME "$command_non_bold" $(date) $command_exit_code_color[$shellcmd_exit ${shellcmd_timer_show}s]$command_non_bold[$(jobs | wc -l) jobs]$(tput sgr0)"

    #PS1=$terminal_non_bold"\w \[$(tput bold)\]@$HOSTNAME "$terminal_non_bold" $(date) $exit_code_color[$shellcmd_exit ${shellcmd_timer_show}s]$terminal_non_bold[$(jobs | wc -l) jobs]

    PS1=" $\[$(tput sgr0)\] "
    shellcmd_timer_stop
}

trap 'shellcmd_timer_start' DEBUG

#export PROMPT_COMMAND='shellcmd_exit=$?; if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.log/bash-history-$(date "+%Y-%m-%d").log; fi'
#if [ "$PROMPT_COMMAND" == "" ]; then
  #PROMPT_COMMAND="shellcmd_timer_stop"
#else
  #PROMPT_COMMAND="$PROMPT_COMMAND; shellcmd_timer_stop"
#fi
PROMPT_COMMAND=augy_prompt_command

#terminal_non_bold="\[$(tput sgr0)\[\e[41m\]"

#PS1=$terminal_non_bold"\w \[$(tput bold)\]@$HOSTNAME "$terminal_non_bold" \$(date) [\$(jobs | wc -l) jobs] [last: \$shellcmd_exit \${shellcmd_timer_show}s]
#$ \[$(tput sgr0)\]"
#PS1="\[$(tput bold)\]$HOSTNAME $ \[$(tput sgr0)\]"

##########################

##########################
# git util
#

# checks for printf/log statements
alias gdc="git diff --staged | egrep '(printf|log)'";

# good for looking at changes between commits in beyondcompare
alias gdd="git difftool --dir-diff --no-symlinks";

##########################

source "$HOME/bin/timeline_lib"

function mkr {
    timeline_mkr "$1"
}

function cdr {
    timeline_cdr "$1"
}

##########################
# HID stuff
#
if [ "$HOSTNAME" == "biskit" ]; then
   if [ -f $MYBIN/c720_trackpad.sh ]; then
      $MYBIN/c720_trackpad.sh
   fi
   if [ -f $HOME/.config/misc/latching_meta.conf ] && hascmd xkbcomp && [ ! -z "$DISPLAY" ]; then
      xkbcomp $HOME/.config/misc/latching_meta.conf $DISPLAY >& /dev/null
   else
      if ! hascmd xkbcomp; then echo "no xkbcomp"; fi
   fi
fi
##########################

##########################
# OSX stuff
#
if grep Darwin <(uname) &> /dev/null ; then
   # for easy listing and ejecting of disks
   function dul ()
   {
      diskutil list;

      if [ ! -z "$1" ];
      then
         echo "diskutil eject /dev/disk$1...";
         diskutil eject /dev/disk$1;
      fi
   }
fi
##########################

##########################
# Linux stuff
#
if grep Linux <(uname) &> /dev/null; then
   # TODO: Could try harder to see what's available here
	alias pbcopy='xsel -ib'
	alias pbpaste='xsel -ob'
    function open() {
        xdg-open "$@"
    }
fi
##########################

function dotgit {
    (
        $(which git) --git-dir=$HOME/.dotgit --work-tree=$HOME "$@"
    )
}
