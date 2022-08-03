
# Start tang's personal configurations
export PS1='\[\e[1;32m\]\u@\H\[\e[0;33m\] \w \[\e[1;34m\]\$\[\e[0m\] '
export LC_ALL=en_US.UTF-8
export HISTTIMEFORMAT="%Y-%m-%d %T "
export HISTCONTROL=ignoreboth
export HISTSIZE=100000
export HISTFILESIZE=2000000

# These configs are not suitable everywhere. For example, for ansible.
if [ "${SHELL##*/}" = "bash" ]; then if [[ "xterm-256color xterm-color xterm screen rxvt cygwin" == *"$TERM"* ]]; then
    eval $(SHELL=/bin/bash $(type -p dircolors))
    bind '"\e[B": history-search-forward'       # use arrow keys to find historical commands
    bind '"\e[A": history-search-backward'
    set bell-style none
    set show-all-if-ambiguous on
    set completion-ignore-case on
    shopt -s checkwinsize histappend
    export PS1='\[\e]0;\h:\w\a\]\n\[\e[1;32m\]\u@\H\[\e[0;33m\] \w \[\e[0m[\D{%H:%M:%S}]\n\[\e[1;$((31+3*!$?))m\]\$\[\e[0m\] '
    if grep --version >/dev/null 2>&1 ; then
        alias grep='grep --color';
    fi
    for f in /usr/share/bash-completion/bash_completion ~/.z.sh ~/.git-completion.bash ~/.git-prompt.sh; do
        if [ -f $f ]; then source $f; fi;
    done
    if type -p __git_ps1; then
        export PS1='\[\e]0;\h:\w\a\]\n\[\e[1;32m\]\u@\H\[\e[0;33m\] \w$(__git_ps1 " (%s)") \[\e[0m[\D{%H:%M:%S}]\n\[\e[1;$((31+3*!$?))m\]\$\[\e[0m\] ';
    fi
fi fi

function - {
    cd -
}

function ~ {
    cd ~
}

function .. {
    cd ..
}

function ../ {
    cd ..
}

function ... {
    cd ../..
}

function .... {
    cd ../../..
}

function take {
    mkdir -p $1
    cd $1
}

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
alias ga='git add'
alias gam='git am'
alias gama='git am --abort'
alias gamr='git am --resolved'
alias gar='git apply --reject'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -D'
alias gbl='git blame'
alias gbr='git branch --remote'
alias gc='git commit'
alias gcb='git checkout -b'
alias gcd='git checkout dev'
alias gc!='git commit --amend'
alias gcl='git clone'
alias gclean='git clean -dfx'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gbd='git branch -D'
alias gd='git diff'
alias gds='git diff --staged'
alias gfo='git fetch origin'
alias gfp='git format-patch'
alias gg='git grep'
alias gl='git pull'
alias glg='git log --stat'
alias gr='git remote'
alias gp='git push'
alias gpu='git push upstream'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase -i'
alias grh='git reset'
alias grhh='git reset HEAD --hard'
alias grhh1='git reset HEAD~ --hard'
alias gs='git show'
alias gst='git status'
alias gsta='git stash push'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gup='git pull --rebase'
alias ll='ls -lF'
alias ls='ls -p --color=auto'
alias rd='rm -rf'
alias rs='repo sync'
alias ru='repo upload'
alias tailf='tail -F'
