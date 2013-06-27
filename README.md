## Installation

1. Go to `$HOME`.
2. `git clone https://github.com/dsdeiz/dotfiles.git dotfiles`
3. `cd dotfiles`
4. `git submodule update --init --recursive`
5. `mkdir vim/{backup,temp}`
6. `for i in *; do if [[ $i != 'bin' && $i != 'gtkrc-2.0' && $i != 'README.md' ]] then; ln -s dotfiles/$i $HOME/.$i; fi; done;`
7. `ln -s dotfiles/gtkrc-2.0 $HOME/.gtkrc-2.0.mine`

# Notes

* Install [powerline] [1]. Install `python2.7` via `brew install python`. In case of encountering an error about user scheme, do [this] [2]. Also see [this] [3].

[1]: https://powerline.readthedocs.org/en/latest/installation/osx.html#installation-osx
[2]: https://github.com/Lokaltog/powerline/issues/552#issuecomment-20093421
[3]: https://powerline.readthedocs.org/en/latest/installation/osx.html?highlight=troubleshoot#i-can-t-see-any-fancy-symbols-what-s-wrong
