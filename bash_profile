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

function mkcd() {
  mkdir -p "$@"
  cd "$@"
}

function lookup() {
  open http://duckduckgo.com/html/?q="$@"
}

PATH="/usr/bin:/bin:/usr/sbin:/sbin"
PATH="$HOME/.cabal/bin:$PATH"
PATH="/usr/local/share/python:$PATH"
PATH="/usr/local/bin:/usr/local/sbin:/usr/local/share:$PATH"
PATH="/usr/local/heroku/bin:$PATH"
PATH="$PATH:/usr/local/Cellar/smlnj/110.75/libexec/bin"
PATH="$PATH:/usr/local/share/npm/bin"

export PATH

export EDITOR=vim
export PS1="\W\[\e[0;32m\]\$(__git_ps1)\[\e[0m\] $ "

export NODE_PATH="/usr/local/lib/node"

export SECRETS_DISK="/Volumes/BACKUP"
export KEY_PAIR_NAME="mars-deploy-pair"
export LOCAL_MARS_CHEF="$HOME/src/marsdd/chef-mars"
export OPSCODE_USER="wlangstroth"

if [ -f $SECRETS_DISK/amazon/aws_access_key_id ]
then
  export AWS_ACCESS_KEY_ID=$(cat ${SECRETS_DISK}/amazon/aws_access_key_id)
else
  echo "Warning: Your AWS access key id is not present."
fi

if [ -f $SECRETS_DISK/amazon/aws_secret_access_key ]
then
  export AWS_SECRET_ACCESS_KEY=$(cat ${SECRETS_DISK}/amazon/aws_secret_access_key)
else
  echo "Warning: Your AWS secret access key is not present."
fi

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
