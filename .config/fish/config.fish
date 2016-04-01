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

# abbres

abbr o "gnome-open"
abbr web "chromium-browser"
abbr cal "ncal -MC"
abbr r "ranger"
abbr l "ls -C --group-directories-first"
abbr ll "ls -A1 --group-directories-first"
abbr lll "ls -Alh --group-directories-first --time-style=long-iso"
abbr llt "ls -Alhtr --group-directories-first --time-style=long-iso"
abbr lld "ls -GAlht"
abbr encfs_syban "encfs /home/syban/.encrypted /home/syban/.decrypted"
abbr cheatsheet "fish -c 'cat ~/doc/cheatsheet | percol | sed \'s/^[^:]*:\s*//g\' | tr -d \'\\n\' | parcellite'"
abbr cheatsheet-edit "fish -c 'vim ~/doc/cheatsheet'"
abbr cheatsheet-add-last-history "history | head -n 1 >> ~/doc/cheatsheet"
abbr history-search "fish -c 'history | percol | tr -d \'\\n\' | parcellite > /dev/null'"

abbr op "sed -nr 's/.*href=\"([^\"]*)\".*/\1/p' ~/.local/share/recently-used.xbel | percol | xargs gnome-open"

# search history (oh my fish)
# @see https://github.com/bpinto/oh-my-fish/tree/master/plugins/percol
function fish_user_key_bindings
  bind \cr percol_select_history
end


# GIT abbres
abbr giunstage "git reset HEAD"
abbr gireverse "git checkout --"
abbr gis "git status"
abbr gid "git diff"
abbr giall "git add ."
abbr gia "git add"
abbr gic "git commit -m"
abbr gil "git log --pretty=format:'%h - %an, %ar : %s'"
abbr gif "git fetch origin"
abbr gico "git checkout"
abbr gib "git branch"
abbr gip "git push"


#git flow abbres
abbr gffs "git flow feature start"

# xrandr abbres
abbr xrandr-pres "xrandr --output eDP1 --mode 800x600 --output HDMI1 --mode 800x600 --same-as eDP1"
abbr xrandr-office "xrandr --output eDP1 --mode 1600x900 --output HDMI1 --mode 1920x1080 --primary --left-of eDP1"
abbr xrandr-home "xrandr --output eDP1 --mode 1600x900 --output HDMI1 --mode 1920x1200 --primary --left-of eDP1"
abbr xrandr-airpl "xrandr --output eDP1 --mode 1600x900 --output HDMI1 --mode 1680x1050 --primary --right-of eDP1"
abbr xrandr-airpl-thi "xrandr --output eDP1 --mode 1600x900 --output HDMI1 --mode 1280x1024 --primary --left-of eDP1"

# backup
abbr backup "duplicity --include ~/.decrypted --include ~/doc/cheatsheet --include ~/.vim/bundle/vim-notes/misc/notes/user --include ~/TODO --exclude '**' ~ scp://backuphost/backups/laptop"


# colors
abbr tail "grc tail"
abbr diff "grc diff"
abbr ps "grc ps"
abbr ping "grc ping"
abbr netstat "grc netstat"
abbr cat "grc cat"

# default tree settings
abbr treee "tree -L 2 | less"

# mysql with usefull options
abbr mysql "mysql --tee=mysql_(date +%F_%I-%M-%S).log"

# creates ssh tunnel for mysql ssh_mysql <server>
abbr ssh_mysql "ssh -L 3306:localhost:3306 -fNg"

# defaults for ag
abbr ag "ag -S --ignore '*jquery*.js' --ignore 'yui' --ignore '.git' --ignore '.svn' --ignore '*.swp' --ignore '*~' --ignore 'tiny_mce*' --ignore 'modernizr*' --ignore '*/vendor/*' --ignore '*.min.js' --ignore '*/plugins/*' --ignore '*.sql' --max-count 20 --pager 'less -RX'"

abbr less "less -R"

set -gx PATH ~/.npm-packages/bin ~/.go/bin $PATH
set -gx NODE_PATH /home/syban/.npm-packages/lib/node_modules

# set -x JAVA_HOME "/usr/lib/jvm/java-8-oracle"
set -x JAVA_HOME "/usr/lib/jvm/java-7-openjdk-amd64"

# GULP competion
complete -c gulp -a "(gulp --tasks-simple)" -f

