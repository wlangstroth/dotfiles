alias ls='ls -Gh'
alias ll='ls -lGh'
alias la='ls -laGh'
alias ..='cd ..'
alias authors='git log | grep ^Author: | sed "s/ <.*//; s/^Author: //" | sort | uniq -c | sort -nr'
alias detab="sed -i '' -e 's/ *$//g' -e 's/	/  /g'"
alias daily="git log --no-merges --since=$(date -v-1d +%Y%m%d) | sed -n -e 's/^    /* /p'"
alias vi=vim
alias push="git push && cap deploy"
alias cabalupgrades="cabal list --installed  | egrep -iv '(synopsis|homepage|license)'"

# unregister broken GHC packages. Run this a few times to resolve dependency rot in installed packages
# ghc-pkg-clean -f cabal/dev/packages*.conf also works
function ghc-pkg-clean() {
    for p in `ghc-pkg check $* 2>&1  | grep problems | awk '{print $6}' | sed -e 's/:$//'`
    do
        echo unregistering $p; ghc-pkg $* unregister $p
    done
}

# remove all installed GHC/cabal packages, leaving ~/.cabal binaries and docs in place
# When all else fails, use this to get out of dependency hell and start over
function ghc-pkg-reset() {
    read -p 'erasing all your user ghc and cabal packages - are you sure (y/n) ? ' ans
    test x$ans == xy && ( \
        echo 'erasing directories under ~/.ghc'; rm -rf `find ~/.ghc -maxdepth 1 -type d`; \
        echo 'erasing ~/.cabal/lib'; rm -rf ~/.cabal/lib; \
        echo 'erasing ~/.cabal/packages'; rm -rf ~/.cabal/packages; \
        echo 'erasing ~/.cabal/share'; rm -rf ~/.cabal/share; \
        )
}

function mkcd() {
  mkdir -p "$@"
  cd "$@"
}

function lookup() {
  open http://duckduckgo.com/html/?q="$@"
}

export EDITOR=vim
export PS1="\W\[\e[0;32m\]\$(__git_ps1)\[\e[0m\] $ "

export NODE_PATH="/usr/local/lib/node"
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/share:/usr/local/share/npm/bin:/usr/local/share/python:$PATH:$HOME/.cabal/bin"

export ANDROID_SDK_ROOT="/usr/local/Cellar/android-sdk/r20.0.1"
export ANDROID_HOME=`brew --prefix android`

export SECRETS_DISK="/Volumes/Will"
export CHEF_ON_MARS="$HOME/src/marsdd/chef-repo"
export MARS_CHEF_USER="wlangstroth"

if [[ -d $HOME/.rbenv ]]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

set completion-ignore-case on

umask 022
