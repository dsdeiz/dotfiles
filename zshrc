#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Source drush_zsh.
alias drupaltags='ctags --langmap=php:.engine.inc.module.theme.php.test --php-kinds=cdfi --languages=php --recurse --fields=+aimS'
alias dr='drush'
alias vim=/usr/local/Cellar/macvim/7.3-66/MacVim.app/Contents/MacOS/Vim
alias tmux-dev="tmux new-session -s tmux -n irc 'irssi -c irc.freenode.net' \; split-window -h 'ssh arch' \; new-window -n ncmpcpp ncmpcpp \; new-window"
