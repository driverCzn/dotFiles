# Path to your oh-my-zsh installation.
ZSH=~/.oh-my-zsh

#eval $(thefuck --alias)
setopt HIST_IGNORE_DUPS
source ~/.zplug/init.zsh
source /usr/bin/virtualenvwrapper.sh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="af-magic"
#humza
#skaro
#ZSH_THEME="powerline"
#POWERLINE_RIGHT_A="mixed"
#POWERLINE_RIGHT_A_COLOR_FRONT="white"
#POWERLINE_RIGHT_A_COLOR_BACK="blue"
#POWERLINE_DATE_FORMAT="%D{%m-%d-%Y}"
#POWERLINE_SHORT_HOST_NAME="true"
#POWERLINE_PATH="short"
#ZLE_RPROMPT_INDENT=1

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
#DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git zsh-autosuggestions zsh-syntax-highlighting colored-man-pages z python pip virtualenvwrapper postgres docker)
# plugins gpg-agent npm pep8
zplug "zplug/zplug", hook-build:'zplug --self-manage'
zplug "plugins/git",                       from:oh-my-zsh
#zplug "plugins/colored-man-pages",         from:oh-my-zsh
zplug "zlsun/solarized-man",               from:github
zplug "plugins/python",                    from:oh-my-zsh
zplug "plugins/pip",                       from:oh-my-zsh
zplug "plugins/virtualenvwrapper",         from:oh-my-zsh
zplug "plugins/postgres",                  from:oh-my-zsh
zplug "plugins/docker",                    from:oh-my-zsh
zplug "plugins/z",                         from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting", from:github
zplug "zsh-users/zsh-autosuggestions",     from:github
zplug "halfo/lambda-mod-zsh-theme",        from:github, as:theme
zplug "b4b4r07/enhancd",                   from:github


# User configuration

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

export PATH="$HOME/.gem/ruby/2.4.0/bin:/usr/share/pwndbg/pwndbg/commands:$PATH"
export CLASSPATH='.'
export LANG=en_US.UTF-8
# export MANPATH="/usr/local/man:$MANPATH"


ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

# some terminal config
export EDITOR=vim
export TERM="xterm-256color"
export VISUAL="vim"

# for enhancd
export ENHANCD_FILTER="fzy"
export ENHANCD_DOT_SHOW_FULLPATH=1

# for shadowsocks
alias ssconfig="sudo vim /etc/shadowsocks/config.json"
alias ssrestart="sudo systemctl restart shadowsocks@config"

# for archlinux
alias syu="yaourt -Syu"
alias syyu="yaourt -Syyu"

# for ctf
alias co="sudo sh -c 'echo "/tmp/core.%t" > /proc/sys/kernel/core_pattern'"
alias aslroff="sudo sh -c 'echo 0 > /proc/sys/kernel/randomize_va_space'"
alias aslron="sudo sh -c 'echo 2 > /proc/sys/kernel/randomize_va_space'"
alias ipwn="ip2 --profile=ipwn"
alias coc="rm /tmp/core*"
alias wp="workon pwn"
alias burpsuite="java -jar ~/Downloads/burpsuite/BurpLoader.jar"
alias msfconsole="msfconsole -x \"db_connect ${USER}@msfdb\""
alias re="readelf"

# for my dorm network
alias startnet="p2 ~/Downloads/looch_net.py"
alias netconfig="vim ~/Downloads/looch_net.py"

# common alias
alias p="proxychains -q"
alias tree="tree -C"
alias gdb="gdb -q"
alias vc="vim ~/.vimrc"
alias g32="gcc -m32"
alias objdump="objdump -M intel"
alias zc="vim ~/.zshrc"
alias ls="ls -F --color=tty --group-directories-first"
alias mb="musicbox"
alias pcalc="pcalc -n"

# I'm so lazy~~~~~~
alias p2="python2"
alias p3="python"
alias ip2="ipython2"
alias ip3="ipython"
alias s="sudo"
alias v="vim"
alias sv="sudo vim"
alias w2="workon py2"
alias w3="workon py3"

# I don't know why this function failed ↓
# this is a shortcut for substitute part of last N command as you wish
function reps(){
    zsh \!-"$1":gs/"$2"/"$3"/
}

source $ZPLUG_REPOS/b4b4r07/enhancd/init.sh
source $ZSH/oh-my-zsh.sh
zplug load

alias tl='tmux list-sessions'
alias ta='tmux attach -t'
alias tn='tmux new-sess -s'
