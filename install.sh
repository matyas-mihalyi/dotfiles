# Install neovim
## build prerequisites
sudo apt-get install ninja-build gettext cmake unzip curl -y
## build neovim
cd ~/neovim && make CMAKE_BUILD_TYPE=RelWithDevInfo
## install neovim
cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb
cd $HOME
## telescope grep find dependencies
sudo apt install fd-find
sudo apt install ripgrep

# install lsps ?

cd .local/lib/
mv ~/dotfiles/package.json .

git clone https://github.com/hrsh7th/vscode-langservers-extracted
git clone https://github.com/typescript-language-server/typescript-language-server
git clone https://github.com/redhat-developer/yaml-language-server

sudo npm i -g vscode-langservers-extracted
sudo npm i -g typescript typescript-language-server
sudo npm i -g yaml-language-server

## todo: dotifles
cd ~/dotfiles


