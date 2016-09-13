Uses [homebrew][1] and [ansible][2].

Mostly taken from `geerlingguy/ansible-*``.

# Installation

1. Install homebrew.
2. `brew install ansible`
3. `git clone https://github.com/dsdeiz/dotfiles ~/.dotfiles`
4. `cd ~/.dotfiles`
5. `ansible-playbook -i 'localhost,' -c local osx.yml`

# Dotfiles

Synchronize the dotfiles via `ansible-playbook -i 'localhost,' -c local -t dotfiles osx.yml`.

[1]: http://brew.sh/
[2]: https://www.ansible.com/
