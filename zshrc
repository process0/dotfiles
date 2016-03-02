# Here to allow Ctrl-S in terminal
# http://unix.stackexchange.com/a/72092
stty -ixon

if [ -e /lib/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
fi

export PATH=$PATH
export MANPATH=$MANPATH:/usr/local/share/man:/opt/local/share/man;
export INFOPATH=$INFOPATH:/opt/local/share/info;

export HISTSIZE=200
export HISTFILE=~/.zsh_history
export SAVEHIST=200

export EDITOR=vim
export SVN_EDITOR=vim
export VIM_APP_DIR=/Applications/MacVim

export LC_CTYPE=en_US.UTF-8

# oh-my-zsh configuration.
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="twisty"
plugins=(git osx vi-mode npm history-substring-search)
source $ZSH/oh-my-zsh.sh

if (( $+commands[nvim] )) ; then
    alias vim=nvim
fi

##
# use 'dirs' to see the stack of past directories
# use cd ~n to access stack
#
setopt auto_pushd

##
# aliases
#
alias ll='ls -laG'
alias '..'='cd ..'
alias svnst='svn status --ignore-externals'
alias fsize='du -hc -d 0'
alias download='wget \
--wait=2 \
--random-wait \
--html-extension \
--recursive \
--level=1 \
--page-requisites \
--convert-links \
--backup-converted'

##
# Subversion colour diff
#
function svncdiff () {
    svn diff $@ | colordiff | less -R;
}

##
# Complete ssh known hosts (from http://gentoo-wiki.com/TIP_Advanced_zsh_Completion)
#
local _myhosts
_myhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
zstyle ':completion:*' hosts $_myhosts

##
# today
#
cat /usr/share/calendar/calendar* | grep "^`date +"%m/%d"`"

##
# Color ls.
# http://creativebits.org/enable_ls_colors_in_tiger
#
#       a   black
#       b   red
#       c   green
#       d   brown
#       e   blue
#       f   magenta
#       g   cyan
#       h   light grey
#       A   bold black, usually shows up as dark grey
#       B   bold red
#       C   bold green
#       D   bold brown, usually shows up as yellow
#       E   bold blue
#       F   bold magenta
#       G   bold cyan
#       H   bold light grey; looks like bright white
#       x   default foreground or background
# 
# Note that the above are standard ANSI colors.  The actual
# display may differ depending on the color capabilities of
# the terminal in use.
# 
# The order of the attributes are as follows:
# 
#       1.  directory
#       2.  symbolic link
#       3.  socket
#       4.  pipe
#       5.  executable
#       6.  block special
#       7.  character special
#       8.  executable with setuid bit set
#       9.  executable with setgid bit set
#       10. directory writable to others, with sticky bit
#       11. directory writable to others, without sticky
#           bit

export CLICOLOR=1;
export LSCOLORS=gxcxfxexdxxxxxxxxxagag;
