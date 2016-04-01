# abbres

alias o "gnome-open"
alias web "chromium-browser"
alias cal "ncal -MC"
alias r "ranger"
alias l "ls -C --group-directories-first"
alias ll "ls -A1 --group-directories-first"
alias lll "ls -Alh --group-directories-first --time-style=long-iso"
alias llt "ls -Alhtr --group-directories-first --time-style=long-iso"
alias lld "ls -GAlht"
alias encfs_syban "encfs $HOME/.encrypted $HOME/.decrypted"
alias cheatsheet "fish -c 'cat ~/doc/cheatsheet | percol | sed \'s/^[^:]*:\s*//g\' | tr -d \'\\n\' | parcellite'"
alias cheatsheet-edit "fish -c 'vim ~/doc/cheatsheet'"
alias cheatsheet-add-last-history "history | head -n 1 >> ~/doc/cheatsheet"

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

# xrandr abbres
abbr xrandr-pres "xrandr --output eDP1 --mode 800x600 --output HDMI1 --mode 800x600 --same-as eDP1"
abbr xrandr-office "xrandr --output eDP1 --mode 1600x900 --output HDMI1 --mode 1920x1080 --primary --left-of eDP1"
abbr xrandr-home "xrandr --output eDP1 --mode 1600x900 --output HDMI1 --mode 1920x1200 --primary --left-of eDP1"
abbr xrandr-airpl "xrandr --output eDP1 --mode 1600x900 --output HDMI1 --mode 1680x1050 --primary --right-of eDP1"
abbr xrandr-airpl-thi "xrandr --output eDP1 --mode 1600x900 --output HDMI1 --mode 1280x1024 --primary --left-of eDP1"

# backup
alias backup "duplicity --include ~/.decrypted --include ~/doc/cheatsheet --include ~/.vim/bundle/vim-notes/misc/notes/user --include ~/TODO --exclude '**' ~ scp://backuphost/backups/laptop"


# colors
alias tail "grc tail"
alias diff "grc diff"
alias ps "grc ps"
alias ping "grc ping"
alias netstat "grc netstat"
alias cat "grc cat"

# default tree settings
alias treee "tree -L 2 | less"

# mysql with usefull options
alias mysql "mysql --tee=mysql_(date +%F_%I-%M-%S).log"

# creates ssh tunnel for mysql ssh_mysql <server>
abbr ssh_mysql "ssh -L 3306:localhost:3306 -fNg"

# defaults for ag
alias ag "ag -S --ignore '*jquery*.js' --ignore 'yui' --ignore '.git' --ignore '.svn' --ignore '*.swp' --ignore '*~' --ignore 'tiny_mce*' --ignore 'modernizr*' --ignore '*/vendor/*' --ignore '*.min.js' --ignore '*/plugins/*' --ignore '*.sql' --max-count 20 --pager 'less -RX'"

# fixes ansi colors issues
# alias less "less -R"

set -gx PATH ~/.npm-packages/bin ~/.go/bin $PATH
set -gx NODE_PATH /home/syban/.npm-packages/lib/node_modules

# set -x JAVA_HOME "/usr/lib/jvm/java-8-oracle"
set -x JAVA_HOME "/usr/lib/jvm/java-7-openjdk-amd64"

# GULP competion
complete -c gulp -a "(gulp --tasks-simple)" -f

