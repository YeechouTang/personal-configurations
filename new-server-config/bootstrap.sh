#!/usr/bin/env bash

curl https://raw.githubusercontent.com/YeechouTang/personal-configurations/master/new-server-config/config.bashrc | tee -a ~/.bashrc
curl -fo ~/.vimrc https://raw.githubusercontent.com/YeechouTang/personal-configurations/master/vim/linux.vimrc
curl -fo ~/.gitconfig https://raw.githubusercontent.com/YeechouTang/personal-configurations/master/new-server-config/linux.gitconfig
curl -fo ~/.gitmsg https://raw.githubusercontent.com/YeechouTang/personal-configurations/master/new-server-config/linux.gitmsg

curl -fo ~/.z.sh https://raw.githubusercontent.com/rupa/z/master/z.sh
curl -fo ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
curl -fo ~/.git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

source ~/.bashrc
