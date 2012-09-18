## Installation

1. Go to `$HOME`.
2. `git clone https://github.com/dsdeiz/dotfiles-toshiba.git dotfiles`
3. `cd dotfiles`
4. `git submodule update --init --recursive`
5. `mkdir vim/{backup,temp}`
6. `for i in *; do if [[ $i != 'bin' && $i != 'gtkrc-2.0' && $i != 'README.md' ]] then; ln -s dotfiles/$i $HOME/.$i; fi; done;`
7. `ln -s dotfiles/gtkrc-2.0 $HOME/.gtkrc-2.0.mine` 
