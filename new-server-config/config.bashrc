PS1="\w \$ "

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

function ../.. {
    cd ../..
}

alias ff='find . -name'
alias ga='git add'
alias gam='git am'
alias gama='git am --abort'
alias gamr='git am --resolved'
alias gar='git apply --reject'
alias gc='git commit'
alias gcb='git checkout -b'
alias gcd='git checkout dev'
alias gc!='git commit --amend'
alias gclean='git clean -dfx'
alias gco='git checkout'
alias gbd='git branch -D'
alias gd='git diff'
alias gfo='git fetch origin'
alias gfp='git format-patch'
alias gg='git grep'
alias glg='git log'
alias gp='git push'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias grh='git reset'
alias gs='git show'
alias gst='git status'
alias gsta='git stash push'
alias gstp='git stash pop'
alias rd='rm -rf'
alias rs='repo sync'
alias ru='repo upload'

