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

# added by travis gem
[ -f /Users/arnoldfrench/.travis/travis.sh ] && source /Users/arnoldfrench/.travis/travis.sh

alias gbc-f=git-feature

# eval "$(docker-machine env development)"
chruby ruby-2.2.0
source $HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh
