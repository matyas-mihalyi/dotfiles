#!/bin/bash

# Install neovim
if [ -d ~/neovim ]; then
  cd ~/neovim
  git checkout stable
  git pull
  cd "$HOME"
else
  git clone https://github.com/neovim/neovim.git
  cd ~/neovim
  git checkout stable
fi

## build prerequisites
sudo apt-get install ninja-build gettext cmake unzip curl -y
## build neovim
cd ~/neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
## install neovim
cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb
cd ~

## telescope grep find dependencies
sudo apt install fd-find ripgrep


# install lsps
npm i -g typescript

cd .local/lib/
mv ~/dotfiles/package.json .

git clone https://github.com/hrsh7th/vscode-langservers-extracted
git clone https://github.com/typescript-language-server/typescript-language-server
git clone https://github.com/redhat-developer/yaml-language-server

cd ~

npm i -g vscode-langservers-extracted
npm i -g typescript typescript-language-server
npm i -g yaml-language-server

# setup dotfiles git repository
git clone -b coder --separate-git-dir=$HOME/.myconfig https://github.com/matyas-mihalyi/dotfiles.git $HOME/myconf-tmp
rm -r ~/myconf-tmp
alias myconfig='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'

cp .gitconfig .gitconfig_backup
myconfig checkout
myconfig config --local status.showUntrackedFiles no
mv -f .gitconfig_backup .gitconfig 

# git config
git config --global core.editor nvim
git config --global color.status.branch 215
git config --global st status
git config --global unstage reset HEAD --
git config --global lg log --oneline -10
git config --global rf checkout HEAD --
git config --global mf checkout --patch --
git config --global co checkout

