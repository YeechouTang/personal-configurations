# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/tangyizhou/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git macos brew autojump zsh-autosuggestions)

autoload zmv

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
alias caf='caffeinate -u -t '
alias cs='cscope -Rbkq'
alias ct="ctags -f /home/tangyizhou/git/code_dir/tags -R --exclude='.git*' --exclude='build*' /home/tangyizhou/git/code_dir"
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias de='docker exec -it'
alias di='docker image'
alias dii="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias dip="docker inspect --format '{{ .State.Pid }}'"
alias dp='docker ps -a'
alias dk='docker kill'
alias dkc='docker kill $(docker ps -q)'
alias dr='docker run -it --rm'
alias drc='docker rm -f $(docker ps -qa)'
alias drd='docker rmi $(docker images -q -f dangling=true)'
alias ff='find . -name'
alias hgs="hexo g && hexo s"
alias hgd="hexo g && hexo d"
alias gam='git am'
alias gama='git am --abort'
alias gamr='git am --resolved'
alias gar='git apply --reject'
alias gcd='git checkout dev'
alias gclean='git clean -dfx'
alias gbd='git branch -D'
alias gfp='git format-patch'
alias gg='git grep'
alias grhh1='git reset HEAD~ --hard'
alias gs='git show'
alias ll='ls -al'
alias rd='rm -rf'
alias rs='repo sync'
alias ru='repo upload'
alias trans='iconv -f GB2312 -t UTF-8 '
# alias ohmyzsh="mate ~/.oh-my-zsh"

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

export PATH="/usr/local/sbin:$PATH"  # Perhaps no use in new Mac
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles

# source /Users/tangyizhou/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
