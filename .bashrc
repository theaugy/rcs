# If not running interactively, don't do anything else
[[ "$-" != *i* ]] && return

##########################
# Vars, aliases, options
#
alias ls="ls --color -lGh"
set -o vi
export EDITOR=vim
export CDP_SOUND_EXT=wav
PATH=$HOME/bin:$PATH:$HOME/.local/bin:$HOME/go/bin
export PATH

# good for looking at changes between commits in beyondcompare
alias gdd="git difftool --dir-diff --no-symlinks";
##########################

##########################
# Prompt
#
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

    #PS1=" ${Red}$\[$(tput sgr0)\] "
    PS1="${Gre}\$HOSTNAME$(tput sgr0) \W ${Red}\$$(tput sgr0) "
}

PROMPT_COMMAND=augy_prompt_command

#terminal_non_bold="\[$(tput sgr0)\[\e[41m\]"

##########################
# Linux stuff
#
if grep Linux <(uname) &> /dev/null; then
   # TODO: Could try harder to see what's available here
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

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
