eval $(thefuck --alias)
# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerline"
POWERLINE_RIGHT_A="mixed"
POWERLINE_RIGHT_A_COLOR_FRONT="white"
POWERLINE_RIGHT_A_COLOR_BACK="blue"
POWERLINE_DATE_FORMAT="%D{%m-%d-%Y}"
#POWERLINE_SHORT_HOST_NAME="true"
POWERLINE_PATH="short"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions colored-man-pages zsh-syntax-highlighting z pip python pep8 virtualenvwrapper)
# plugins postgres npm
# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"


# You may need to manually set your language environment
export LANG=en_US.UTF-8

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
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
source /usr/bin/virtualenvwrapper.sh
export EDITOR=vim
export TERM="xterm-256color"
export VISUAL="vim"
export PYTHONSTARTUP=~/.pythonrc
alias mb="musicbox"
alias p="proxychains -q"
alias burpsuite="java -jar ~/Downloads/burpsuite/BurpLoader.jar"
alias tree="tree -C"
alias ls="ls -F --color=tty --group-directories-first"
alias zc="vim ~/.zshrc"
alias msfconsole="msfconsole -x \"db_connect ${USER}@msfdb\""
alias gdb="gdb -q"
alias pcalc="pcalc -n"
alias p2="python2"
alias p3="python"
alias ip2="ipython2"
alias ip3="ipython"
alias ssconfig="sudo vim /etc/shadowsocks/config.json"
alias ssrestart="sudo systemctl restart shadowsocks@config"
alias vc="vim ~/.vimrc"
alias startnet="p2 ~/Downloads/looch_net.py"
alias syu="yaourt -Syu"
alias g32="gcc -m32"
alias pwn="gdb"
alias objdump="objdump -M intel"
