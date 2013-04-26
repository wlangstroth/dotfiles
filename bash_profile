# Mac/BSD ls
alias ls='ls -Gh'
alias ll='ls -lGh'
alias la='ls -laGh'

# -- editors of Note -----------------------------------------------------------
alias v=vim
alias vi=vim
alias e=emacs

# -- clever one-liners and helpers ---------------------------------------------
alias ..='cd ..'
alias authors='git log | grep ^Author: | sed "s/ <.*//; s/^Author: //" | sort | uniq -c | sort -nr'
alias detab="sed -i '' -e 's/ *$//g' -e 's/	/    /g'"
alias pushit="git push && cap deploy"
alias cabalupgrades="cabal list --installed  | egrep -iv '(synopsis|homepage|license)'"
alias screencap="ffmpeg -f x11grab -s wxga -r 25 -i :0.0 -sameq /tmp/out.mpg"
alias volumes="mount | column -t"
alias be="bundle exec"

# -- functions -----------------------------------------------------------------
function mkcd() {
  mkdir -p "$@"
  cd "$@"
}

function lookup() {
  open http://duckduckgo.com/html/?q="$@"
}

# -- colours for man pages in less --------------------------------------------
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# -- path ----------------------------------------------------------------------
PATH="/usr/bin:/bin:/usr/sbin:/sbin"
PATH="$HOME/.cabal/bin:$PATH"
PATH="/usr/local/bin:/usr/local/sbin:/usr/local/share:$PATH"
PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

PATH="$PATH:/usr/local/Cellar/smlnj/110.75/libexec/bin"
PATH="$PATH:/usr/local/share/npm/bin"

export CPATH="/usr/local/include"

# -- virtualenv ----------------------------------------------------------------
# virtualenv should use Distribute instead of legacy setuptools
export VIRTUALENV_DISTRIBUTE=true
# Centralized location for new virtual environments
export PIP_VIRTUALENV_BASE=$HOME/Virtualenvs
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# -- default editor ------------------------------------------------------------
export EDITOR=vim

# -- prompt with git info ------------------------------------------------------
export PS1="\W\[\e[0;32m\]\$(__git_ps1)\[\e[0m\] $ "

# -- nodejs --------------------------------------------------------------------
export NODE_PATH="/usr/local/lib/node"

# -- homebrew ------------------------------------------------------------------
if [ -f $(brew --prefix)/etc/bash_completion ]
then
  . $(brew --prefix)/etc/bash_completion
fi
set completion-ignore-case on

umask 022

# -- rbenv ---------------------------------------------------------------------
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
