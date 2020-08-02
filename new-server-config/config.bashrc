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

alias rd='rm -rf'
alias ff='find . -name'
alias ga='git add'
alias gc='git commit'
alias gcb='git checkout -b'
alias gcd='git checkout dev'
alias gc!='git commit --amend'
alias gclean='git clean -dfx'
alias gco='git checkout'
alias gbd='git branch -D'
alias gd='git diff'
alias gfo='git fetch origin'
alias gg='git grep'
alias gp='git push'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias grh='git reset'
alias gs='git show'
alias gsta='git stash push'
alias gstp='git stash pop'