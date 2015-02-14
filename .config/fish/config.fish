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
alias gipom "git push origin master"
alias giunstage "git reset HEAD"
alias gireverse "git checkout --"
alias gis "git status"
alias gid "git diff"
alias giall "git add ."
alias gia "git add"
alias gic "git commit -m"
alias gil "git log --pretty=format:'%h - %an, %ar : %s'"
alias gif "git fetch origin master"
alias gico "git checkout"
alias gib "git branch"


#git flow aliases
alias gffs "git flow feature start"

# xrandr aliases
alias xrandr-pres "xrandr --output eDP1 --mode 800x600 --output HDMI1 --mode 800x600 --same-as eDP1"
alias xrandr-office "xrandr --output eDP1 --mode 1600x900 --output HDMI1 --mode 1920x1080 --primary --right-of eDP1"
alias xrandr-home "xrandr --output eDP1 --mode 1600x900 --output HDMI1 --mode 1920x1200 --primary --left-of eDP1"
alias xrandr-airpl "xrandr --output eDP1 --mode 1600x900 --output HDMI1 --mode 1680x1050 --primary --right-of eDP1"
alias xrandr-airpl-thi "xrandr --output eDP1 --mode 1600x900 --output HDMI1 --mode 1280x1024 --primary --left-of eDP1"

# backup
alias backup "duplicity --include ~/doc/cheatsheet --include ~/.vim/bundle/vim-notes/misc/notes/user --include ~/TODO --exclude '**' ~ scp://capcadonline/backups/laptop"


# colors  
alias tail "grc tail"
alias ps "grc ps"
alias ping "grc ping"
alias netstat "grc netstat"
alias cat "grc cat"

# default tree settings
alias treee "tree -L 2 | less"

# mysql with usefull options
alias mysql "mysql --tee=mysql_(date +%F_%I-%M-%S).log"

# creates ssh tunnel for mysql ssh_mysql <server>
alias ssh_mysql "ssh -L 3306:localhost:3306 -fNg"
