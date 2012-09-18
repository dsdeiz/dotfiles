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

# Drupal aliases
alias drush="$HOME/.drush/drush"
alias drupaltags='ctags --langmap=php:.engine.inc.module.theme.php.test --php-kinds=cdfi --languages=php --recurse'
