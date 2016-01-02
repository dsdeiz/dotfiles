#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

alias drupaltags='ctags --links=yes --langmap=php:.engine.inc.module.theme.php.test --php-kinds=cdfi --languages=php --recurse --fields=+laimS'
alias dr='drush'
alias tmux-dev="tmux new-session -s tmux -n irc 'irssi -c irc.freenode.net' \; split-window -h 'ssh feral' \; new-window -n ncmpcpp ncmpcpp \; new-window"
# source ~/.fzf.zsh

# added by travis gem
[ -f /Users/arnoldfrench/.travis/travis.sh ] && source /Users/arnoldfrench/.travis/travis.sh

# Utility to create a new branch with `feature-` in it.
function git-checkout-feature {
  if [[ -z $1 ]]; then
    print "Ticket number is required."
    return 1
  fi

  if [[ -z $2 ]]; then
    print "Branch name is required."
    return 1
  fi

  TICKET=$1
  BRANCH_NAME="feature-$1-$2"
  FILE="$( git-root )/.branches"

  git checkout -b "$BRANCH_NAME"
  touch "$FILE"

  grep -q "^$BRANCH_NAME" $FILE && sed -i '' "s/^$BRANCH_NAME.*$/$BRANCH_NAME = $TICKET/" $FILE \
    || echo "$BRANCH_NAME = $TICKET" >> $FILE

  return 0
}

alias gbc-f=git-checkout-feature

eval "$(docker-machine env development)"
