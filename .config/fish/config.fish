# configs for other utilities

set -gx FZF_ALT_C_COMMAND 'ag --nocolor --ignore \'node_modules\' --ignore \'.git\' --ignore \'.svn\' --ignore \'*.swp\' --ignore \'*~\'  --ignore \'*/vendor/*\' --ignore \'*.min.*\' --ignore \'dist\' --ignore \'*/target/*\' --ignore \'*/build/*\' -g ""'
set -gx FZF_DEFAULT_COMMAND 'ag --nocolor --ignore \'node_modules\' --ignore \'.git\' --ignore \'.svn\' --ignore \'*.swp\' --ignore \'*~\'  --ignore \'*/vendor/*\' --ignore \'*.min.*\' --ignore \'dist\' --ignore \'*/target/*\' --ignore \'*/build/*\' -g ""'
set -gx TERM 'xterm-256color'
set -gx NO_AT_BRIDGE 1

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
alias cheatsheet "fish -c 'cat ~/doc/cheatsheet | fzf | sed \'s/^[^:]*:\s*//g\' | tr -d \'\\n\' | clipit'"
alias cheatsheet-edit "fish -c 'vim ~/doc/cheatsheet'"
alias cheatsheet-add-last-history "history | head -n 1 >> ~/doc/cheatsheet"
abbr d "fasd -l | fzf --tac --tiebreak=index -q (commandline -b) | read -l fzf_last_select; [ \$fzf_last_select  ]; and commandline -rb 'cd '\$fzf_last_select"
abbr f "grep --line-buffered --color=never -r [a-zA-Z] * | sort | uniq | fzf --preview=\"echo {} | cut -d':' -f1|xargs pygmentize -g\" | cut -d':' -f1 | xargs pygmentize -g"

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
alias xrandr-pres "xrandr --output eDP1 --mode 800x600 --output HDMI1 --mode 800x600 --same-as eDP1"
alias xrandr-office "xrandr --output eDP1 --mode 1600x900 --output HDMI1 --mode 1920x1080 --primary --left-of eDP1"
alias xrandr-home "xrandr --output eDP1 --mode 1600x900 --output HDMI1 --mode 1920x1200 --primary --left-of eDP1"
alias xrandr-airpl "xrandr --output eDP1 --mode 1600x900 --output HDMI1 --mode 1680x1050 --primary --right-of eDP1"

# backup
set backup_src "--include ~/.decrypted --include ~/doc/cheatsheet --include ~/dotfiles --exclude '**'"
abbr backup_ssh "duplicity $backup_src ~ scp://backuphost/backups/laptop"
abbr backup_usb "duplicity $backup_src ~ file:///media/syban/cle/backup"


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
alias ag "ag -S --ignore '*jquery*.js' --ignore 'yarn.lock' --ignore 'yui' --ignore '.git' --ignore '.svn' --ignore '*.swp' --ignore '*~' --ignore 'tiny_mce*' --ignore 'modernizr*' --ignore '*/vendor/*' --ignore '*.min.*' --ignore '*/plugins/*' --ignore '*.sql' --max-count 20 --pager 'less -RX'"

alias sag "sag -S --ignore '*jquery*.js' --ignore 'yarn.lock' --ignore 'yui' --ignore '.git' --ignore '.svn' --ignore '*.swp' --ignore '*~' --ignore 'tiny_mce*' --ignore 'modernizr*' --ignore '*/vendor/*' --ignore '*.min.*' --ignore '*/plugins/*' --ignore '*.sql' --max-count 20"

# fixes ansi colors issues
alias less "less -R"

set -gx PATH ~/.npm-packages/bin $PATH
set -gx PATH ~/.go/bin $PATH
set -gx PATH ~/.go/bin $PATH
set -gx PATH ~/.config/yarn/global/node_modules/.bin $PATH
set -gx NODE_PATH /home/syban/.npm-packages/lib/node_modules

set -x JAVA_HOME "/usr/lib/jvm/java-8-oracle"
# set -x JAVA_HOME "/usr/lib/jvm/java-7-openjdk-amd64"

# GULP competion
complete -c gulp -a "(gulp --tasks-simple)" -f

# set fisher_home ~/.local/share/fisherman
# set fisher_config ~/.config/fisherman
# source $fisher_home/config.fish

function fuck -d "Correct your previous console command"
    set -l exit_code $status
    set -x TF_ALIAS fuck
    set -l fucked_up_command $history[1]
    thefuck $fucked_up_command | read -l unfucked_command
    if [ "$unfucked_command" != "" ]
        eval $unfucked_command
        if test $exit_code -ne 0
            history --delete $fucked_up_command
            history --merge ^ /dev/null
            return 0
        end
    end
end
