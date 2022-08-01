#!/usr/bin/env bash

set +e

PACKAGE_SYSTEM=""
echo "Start to install basic packages..."
# as 'which' is not built-in command, we use 'type' here
if [ $(type -t "yum") ]; then
    $PACKAGE_SYSTEM="yum"
    yum install -y bash-completion git vim expect gcc ncurses-devel bison flex elfutils-libelf-devel openssl-devel
elif [ $(type -t "apt") ]; then
    $PACKAGE_SYSTEM="apt"
    apt install -y bash-completion git vim expect make build-essential ncurses-devel bison flex libelf-dev libssl-dev
else
    echo "Skip installing basic packages!"
fi
echo "Basic packages installation completed!"

echo "Start to configuring..."
curl https://raw.githubusercontent.com/YeechouTang/personal-configurations/master/new-server-config/config.bashrc | tee -a ~/.bashrc
curl -fo ~/.vimrc https://raw.githubusercontent.com/YeechouTang/personal-configurations/master/vim/linux.vimrc
curl -fo ~/.gitconfig https://raw.githubusercontent.com/YeechouTang/personal-configurations/master/new-server-config/linux.gitconfig
curl -fo ~/.gitmsg https://raw.githubusercontent.com/YeechouTang/personal-configurations/master/new-server-config/linux.gitmsg

curl -fo ~/.z.sh https://raw.githubusercontent.com/rupa/z/master/z.sh
curl -fo ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
curl -fo ~/.git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
echo "Configuration completed!"

echo "Start to install Vundle and its plugins for Vim..."
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
echo "Vundle installation completed!"

set -e

echo "Start to install fzf for zsh..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
spawn ~/.fzf/install
expect {
    "*[y]*" { send "y\n"; exp_continue; }
}
expect eof
echo "fzf installation completed!"

echo "Start to install packages..."
if [ $PACKAGE_SYSTEM == "yum" ]; then
    yum install -y gcc ncurses-devel bison flex elfutils-libelf-devel openssl-devel
elif [ $PACKAGE_SYSTEM == "apt" ]; then
    apt install -y make build-essential libncurses-dev bison flex libelf-dev libssl-dev
else
    echo "Skip installing packages!"
fi
echo "Packages installation completed!"

source ~/.bashrc
