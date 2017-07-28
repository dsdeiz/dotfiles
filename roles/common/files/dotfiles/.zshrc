export LC_ALL="en_US.UTF-8"

zstyle ':prezto:module:editor' dot-expansion 'yes'
zstyle ':prezto:*:*' color 'yes'
zstyle ':prezto:module:git:status:ignore' submodules 'all'
zstyle ':prezto:module:prompt' theme 'steeef'
zstyle ':prezto:module:ruby:chruby' auto-switch 'yes'

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# Prezto modules. {{{

zplug "modules/environment", from:prezto
zplug "modules/terminal", from:prezto
zplug "modules/editor", from:prezto
zplug "modules/history", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/spectrum", from:prezto
zplug "modules/utility", from:prezto
zplug "modules/completion", from:prezto
zplug "modules/prompt", from:prezto
zplug "modules/git", from:prezto
zplug "modules/archive", from:prezto
zplug "modules/syntax-highlighting", from:prezto
zplug "modules/rsync", from:prezto
zplug "modules/history-substring-search", from:prezto
zplug "modules/python", from:prezto
zplug "modules/ruby", from:prezto
zplug "modules/fasd", from:prezto
zplug "modules/homebrew", from:prezto
zplug "modules/node", from:prezto
zplug "modules/gpg", from:prezto

# }}}

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# zplug load --verbose
zplug load

# Prezto settings. {{{

export BROWSER='open'
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

typeset -gU cdpath fpath mailpath path

cdpath=(
  $HOME/Devel
  $cdpath
)

path=(
  $HOME/bin
  $(brew --prefix homebrew/php/php56)/bin
  /usr/local/opt/gnu-tar/libexec/gnubin
  $HOME/Library/Haskell/bin
  /usr/local/mysql/bin
  $HOME/.composer/vendor/bin
  /usr/local/{bin,sbin}
  $HOME/.cargo/bin
  $path
)

export TMPDIR="/tmp/$USER"
mkdir -p -m 700 "$TMPDIR"
TMPPREFIX="${TMPDIR%/}/zsh"
mkdir -p "$TMPPREFIX"

# }}}

source <(gopass completion zsh)
export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages:$PYTHONPATH
export NVM_DIR="$HOME/.nvm"
source "/usr/local/opt/nvm/nvm.sh"
