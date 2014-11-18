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
alias cheatsheet "fish -c 'cat ~/doc/cheatsheet | percol | sed \'s/^[^:]*:\s*//g\' | tr -d \'\\n\' | parcellite'"
alias cheatsheet-edit "fish -c 'vim ~/doc/cheatsheet'"
alias cheatsheet-add-last-history "history | head -n 1 >> ~/doc/cheatsheet"
alias history-search "fish -c 'history | percol | tr -d \'\\n\' | parcellite > /dev/null'"

# search history (oh my fish)
# @see https://github.com/bpinto/oh-my-fish/tree/master/plugins/percol
function fish_user_key_bindings
  bind \cr percol_select_history
end


# GIT aliases
alias gpom "git push origin master"
alias gr "git reset HEAD"
alias gc "git checkout --"
alias gs "git status"
alias gd "git diff"

# xrandr aliases
alias xrandr-pres "xrandr --output eDP1 --mode 800x600 --output HDMI1 --mode 800x600 --same-as eDP1"
alias xrandr-desktop "xrandr --output eDP1 --mode 1600x900 --output HDMI1 --mode 1920x1080 --primary --right-of eDP1"

# backup
alias backup "duplicity --include ~/doc/cheatsheet --include ~/.vim/bundle/vim-notes/misc/notes/user --exclude '**' ~ scp://capcadonline/backups/laptop"



