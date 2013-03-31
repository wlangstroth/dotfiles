alias ls='ls -Gh'
alias ll='ls -lGh'
alias la='ls -laGh'
alias ..='cd ..'
alias authors='git log | grep ^Author: | sed "s/ <.*//; s/^Author: //" | sort | uniq -c | sort -nr'
alias detab="sed -i '' -e 's/ *$//g' -e 's/	/  /g'"
alias daily="git log --no-merges --since=$(date -v-1d +%Y%m%d) | sed -n -e 's/^    /* /p'"
alias vi=vim
alias pushit="git push && cap deploy"
alias cabalupgrades="cabal list --installed  | egrep -iv '(synopsis|homepage|license)'"
alias screencap="ffmpeg -f x11grab -s wxga -r 25 -i :0.0 -sameq /tmp/out.mpg"
alias volumes="mount | column -t"

function mkcd() {
  mkdir -p "$@"
  cd "$@"
}

function lookup() {
  open http://duckduckgo.com/html/?q="$@"
}

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

PATH="/usr/bin:/bin:/usr/sbin:/sbin"
PATH="$HOME/.cabal/bin:$PATH"
PATH="/usr/local/bin:/usr/local/sbin:/usr/local/share:$PATH"
PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

PATH="$PATH:/usr/local/Cellar/smlnj/110.75/libexec/bin"
PATH="$PATH:/usr/local/share/npm/bin"

export PATH

export CPATH="/usr/local/include"

# -- Virtualenv ----------------------------------------------------------------
# virtualenv should use Distribute instead of legacy setuptools
export VIRTUALENV_DISTRIBUTE=true
# Centralized location for new virtual environments
export PIP_VIRTUALENV_BASE=$HOME/Virtualenvs
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
# ------------------------------------------------------------------------------

export EDITOR=vim
export PS1="\W\[\e[0;32m\]\$(__git_ps1)\[\e[0m\] $ "

export NODE_PATH="/usr/local/lib/node"

export SECRETS_DISK="/Volumes/BACKUP"
export KEY_PAIR_NAME="mars-deploy-pair"
export LOCAL_MARS_CHEF="$HOME/src/marsdd/chef-mars"
export OPSCODE_USER="wlangstroth"
export ORGNAME="marsdd"

# if [ -f $SECRETS_DISK/amazon/aws_access_key_id ]
# then
#   export AWS_ACCESS_KEY_ID=$(cat ${SECRETS_DISK}/amazon/aws_access_key_id)
# else
#   echo "Warning: Your AWS access key id is not present."
# fi
#
# if [ -f $SECRETS_DISK/amazon/aws_secret_access_key ]
# then
#   export AWS_SECRET_ACCESS_KEY=$(cat ${SECRETS_DISK}/amazon/aws_secret_access_key)
# else
#   echo "Warning: Your AWS secret access key is not present."
# fi

if [[ -d $HOME/.rbenv ]]
then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

if [ -f $(brew --prefix)/etc/bash_completion ]
then
  . $(brew --prefix)/etc/bash_completion
fi

set completion-ignore-case on

umask 022

eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"