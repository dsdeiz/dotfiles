## Installation

1. Go to `$HOME`.
2. `git clone https://github.com/dsdeiz/dotfiles.git --recurse-submodules .dotfiles`
3. `cd .dotfiles`

To install the configurations for each 'application', use `stow [application]` e.g. for zsh, `stow zsh`.

# Requirements

* [Stow][1]
* Zsh

# Dependencies

## NPM

* `diff-so-fancy`

## Brew

### Packages

* `ag`

### Taps

`caskroom/cask`
`caskroom/versions`
`homebrew/binary`
`homebrew/dupes`
`homebrew/fuse`
`homebrew/games`
`homebrew/php`
`homebrew/versions`
`mopidy/mopidy`
`mpv-player/mpv`

## Mail Configuration

This is a combination of tools that makes up the whole mail client. `mutt` is the actual mail client. It's configured to make use of several tools for sending, reading, etc.

### Tools

* [`urlview`](http://linuxcommand.org/man_pages/urlview1.html)
* [`offlineimap`](http://www.offlineimap.org/)
* [`notmuch`](https://notmuchmail.org/)
* [`w3m`](http://w3m.sourceforge.net/)
* [`pass`](https://www.passwordstore.org/)
* [`abook`](http://abook.sourceforge.net/)
* [`msmtp`](http://msmtp.sourceforge.net/)
* [`view_attachment.sh`](https://gist.github.com/xxx/2942855)

**TODO:**

`notmuch`'s `post-new` hook.

[1]: http://www.gnu.org/software/stow/
