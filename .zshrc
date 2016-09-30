# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"
ZSH_THEME="zshprompt"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git virtualenvwrapper extract)

# User configuration
setxkbmap -layout us -option ctrl:nocaps

# PATH export
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:.local/lib/python2.7/site-packages:$HOME/.local/bin"

export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/go

export PATH=$PATH:~/.bin:$GOPATH/bin

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Neovim color support
#export TERM=xterm-256color
source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Example aliases
alias zshconfig="nvim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vimrc="nvim ~/.vimrc"

# Hosts
alias hosts="sudo nvim /etc/hosts"

# Server
alias scron01='ssh lengow@95.131.141.171'

alias lengow_db='psql -h 10.100.1.240 -d lengow -U lengow'

# Dev
alias work="cd ~/workspace/pymarketplace-2.7 && workon pyMarket; unset DJANGO_SETTINGS_MODULE; find . -name '*.pyc' -exec rm {} \\;"
alias work3="cd ~/workspace/pymarketplaces && workon pyMarket3.4; export DJANGO_SETTINGS_MODULE=pyMarketPlaces.settings.dev;find . -name '*.pyc' -exec rm {} \\;" 
alias v3="cd ~/workspace/v3 && workon v3; export DJANGO_SETTINGS_MODULE=pyMarketPlaces.settings.dev;find . -name '*.pyc' -exec rm -f {} \\;"
alias solution="cd ~/workspace/svn;"
alias cbs="rm -rf /tmp/ClientByServer; rsync -zqr --stats batch06:/space/home/lengow/apps/core/ClientByServer /tmp;sudo cp /tmp/ClientByServer/* /space/home/lengow/apps/core/ClientByServer/;sudo cp /tmp/ClientByServer/* /var/www/vhosts/lengow.com/ClientByServer;rm -rf /tmp/ClientByServer;echo 'done';"

# Python
alias checkpy2="python2.7 -m py_compile"
alias checkpy3="python -m py_compile"

# System
alias update="sudo apt-get udpate"
alias upgrade="sudo apt-get upgrade"
alias gti="git"

export BEEP=~/Téléchargements/OOT_Get_Rupee.wav
alias beep="paplay $BEEP"

# Tmux
alias tmux='tmux -2'
alias clean_swap='rm ~/.local/share/nvim/swap/*.swp'

alias sqltabs='/usr/bin/sqltabs-linux-x64/sqltabs'

alias lengow_client='mycli -h95.131.141.166 -P3706 -umickael -paurelien -D lengow_client'
alias lengow_tracking='mycli -h95.131.141.166 -P3706 -umickael -paurelien -D lengow_tracking'
alias lengow_marketplaces='mycli -h95.131.141.166 -P3706 -umickael -paurelien -D lengow_marketplaces'
alias lengow_thesaurus='mycli -h95.131.141.166 -P3706 -umickael -paurelien -D lengow_thesaurus'
alias bdd-06='mycli -h95.131.141.166 -P3306 -umickael -paurelien -D lengow_flux'

alias beego_db='pgcli postgres://heisenberg:lospolloshermanos@localhost:5432/beego'

alias pg_pre_prod='pgcli postgres://lengow:0FRW!9KIKq@10.0.3.105:5432'
alias pg_dev='pgcli postgres://lengow:lengow44@10.100.1.240:5432'

alias do-api-orders='docker run --rm -it --name api -v /home/sebastien/workspace/showflux:/usr/src/python/work/src -p 8052:8052 --net=host --privileged api-commandes'
alias do-api-orders-restart='docker rm -f api; do-api-orders'

alias settings_prod="export APP_SETTINGS_MODE='production'"
alias settings_dev="export APP_SETTINGS_MODE='dev'"
alias logistics_hosts="sudo awk -i inplace '{if ($1 ~ /^#127/ && $2 == \"logistics.lengow.com\") gsub(/#127/, \"127\"); else if ($1 ~ !/#/ && $1 ~ /127/ && $2 == \"logistics.lengow.com\") gsub(/127/, \"#127\"); print;}' /etc/hosts"
alias middleware="cd ~/workspace/middleware; workon middleware;export MIDDLEWARE_SETTING_MODE=\"$HOME/workspace/middleware/api/settings/dev.py\";"

tnew() {
    tmux new-session -As `basename $PWD`
}

gotest() {
  go test -v . | sed ''/PASS/s//$(printf "\033[32mPASS\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/''
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fpath=(~/.zsh/completion $fpath) 
autoload -Uz compinit && compinit -i

SC_CLIENT_ID=531e00c61d52954581320843ff2fc19f
