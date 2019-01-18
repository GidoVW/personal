# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# COLORS
export COLOR_NC='\e[0m' # No Color
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[0;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# GIT DIFF
# Git diff-so-fancy script
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"

# Git diff colors
git config --global color.ui true

git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

git config --global color.diff.meta       "yellow"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"


# Git aliases
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
  
  # Add git completion to aliases
  __git_complete gco _git_checkout
  __git_complete gpl _git_pull
  __git_complete ga  _git_add
  __git_complete gcm _git_commit
  __git_complete gp  _git_push
  __git_complete gr  _git_rebase

fi

alias gl='git --no-pager log --pretty=format:"%C(yellow)%h %<(50)%Creset%s%C(cyan) %an%C(green)[%ad]" --decorate --date=short HEAD~10..HEAD'
alias ga='git add'
alias gap='git add -p'
alias gc='git commit --verbose'
alias gca='git commit --amend --verbose'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gcf='git commit --fixup'
alias gd='git diff'
alias gds='git diff --stat'
alias gdc='git diff --cached'
alias gs='git status -s'
alias gco='git checkout'
alias gcob='git checkout -b'
alias grc='git rebase --continue'
alias gri='git rebase -i'
alias gr='git rebase'
alias gpl='git pull'
alias gp='git push'
alias gpf='git push --force'
alias gsh='git show'
alias gcp='git cherry-pick'

gla() {
   echo "
    ga =   git add
    gap =  git add -p
    gc =   git commit --verbose
    gca =  git commit --amend --verbose
    gcm =  git commit -m
    gcam = git commit -a -m
    gcf =  git commit --fixup
    
    gd =   git diff
    gds =  git diff --stat
    gdc =  git diff --cached
    gsh =  git show

    gs =   git status -s
    gco =  git checkout
    gcob = git checkout -b
    gp =   git push /* Auto-complete doesn't work */
    gpl =  git pull
    gcp =  git cherry-pick

    grc =  git rebase --continue
    gri =  git rebase -i
    gr =   git rebase 

    gla =  'shows all git aliases'
    "
}

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -e /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
    . /usr/share/git-core/contrib/completion/git-prompt.sh
    else
    . ~/scripts/git-prompt.sh
fi

THEIP=$(ifconfig  | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1}')
CYAN="\[\033[0;36m\]"
GREEN="\[\033[0;32m\]"
RED="\[\033[0;31m\]"
PURPLE="\[\033[0;35m\]"
NO_COLOUR="\[\033[0m\]"
LIGHT_RED='\e[1;31m'

export PS1="$GREEN\u@"$THEIP" $LIGHT_RED\w$NO_COLOUR:$CYAN\$(__git_ps1) $NO_COLOUR\n\!\$ "

LS_COLORS=$LS_COLORS:'ow=1;34:tw=1;34:' ; export LS_COLORS


#####################
# VDC
#####################
# AWS PATH EXPORT
export PATH=$PATH:~/.local/bin

# VDC DEV UTILS
source ~/vdc/vdc-dev-utils/vdc-dev-utils.sh

# PSM
source ~/vdc/runpsm.sh

# PROXY
source ~/scripts/proxy-utils.sh
