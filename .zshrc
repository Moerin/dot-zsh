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
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$HOME/.local/lib/python2.7/site-packages:$HOME/.local/bin:$HOME/.bin"

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin

export PATH=$PATH:$GOBIN
export PATH=$PATH:~/.bin:$GOPATH/bin

if command -v most > /dev/null 2>&1; then
    export PAGER="most"
else
    man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
    }
fi

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


# Dev
# Python
alias checkpy2="python2.7 -m py_compile"
alias checkpy3="python -m py_compile"

# System
alias gti="git"

# Tmux
alias tmux='tmux -2'
alias clean_swap='rm ~/.local/share/nvim/swap/*.swp'


alias beego_db='pgcli postgres://heisenberg:lospolloshermanos@localhost:5432/beego'

alias aws_conf="nvim ~/.config/awesome/rc.lua"
alias dual='xrandr --auto --output eDP-1 --mode 1920x1080 --left-of DP-1'

alias nvimdiff='nvim -d'
tnew() {
    tmux new-session -As `basename $PWD`
}

gotest() {
  go test -v . | sed ''/PASS/s//$(printf "\033[32mPASS\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/''
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i


# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
# Vi style:
 #zle -N edit-command-line
 #bindkey -M vicmd v edit-command-line

# Dual screen position
#source ~/.screenlayout/dual.sh

# Aws autocompleter
source $(dirname $(which aws_completer))/aws_zsh_completer.sh
