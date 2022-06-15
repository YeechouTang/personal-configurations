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
alias rd='rm -rf'
alias rs='repo sync'
alias ru='repo upload'

