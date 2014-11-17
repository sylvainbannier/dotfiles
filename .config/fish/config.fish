# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme robbyrussell

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

set fish_plugins git php percol vundle	

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# aliases

alias o "gnome-open"
alias lll "ls -Galh"
alias encfs_syban "encfs /home/syban/.encrypted /home/syban/.decrypted"



