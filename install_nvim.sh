#!/bin/bash

SW_RELEASE=~/software_release
NVIM_ARCH=nvim-linux64
NVIM_DIR="$SW_RELEASE"/"$NVIM_ARCH"

NIGHTLY_DIR_URL=https://github.com/neovim/neovim/releases/download/nightly/
TAR_GZ="$NVIM_ARCH".tar.gz

[[ -d "$SW_RELEASE" ]] ||
    mkdir "$SW_RELEASE"

[[ -f "$SW_RELEASE"/"$TAR_GZ" ]] ||
    wget "$NIGHTLY_DIR_URL"/"$TAR_GZ" \
        -P "$SW_RELEASE"

[[ -f "$SW_RELEASE"/"$TAR_GZ" ]] && [[ ! -d "$NVIM_DIR" ]] &&
    cd "$SW_RELEASE" && tar xf "$TAR_GZ"

[[ -d "$NVIM_DIR" ]] &&
    echo PATH="$NVIM_DIR"/bin:'$PATH' >> ~/.zshrc

# INSTALL FINISH

NVIM_CONFIG_DIR=~/.config/nvim/
NVIM_CONFIG_FILE="$NVIM_CONFIG_DIR"/init.vim

[[ -f "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim ]] ||
    # from https://github.com/junegunn/vim-plug
    curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

[[ -x $(which node) ]] ||
    curl -sL install-node.now.sh/lts | sudo bash

sudo apt-get -y -qq install ripgrep python3-pip
sudo python3 -m pip install -U pip
sudo python3 -m pip install -U neovim


[[ -d ~/dotFiles ]] ||
    git clone https://github.com/driverCzn/dotFiles ~/dotFiles

[[ -d "$NVIM_CONFIG_DIR" ]] ||
    mkdir "$NVIM_CONFIG_DIR"

[[ -f "$NVIM_CONFIG_FILE" ]] ||
    ln -s ~/dotFiles/init_2021.vim "$NVIM_CONFIG_FILE"

nvim +PlugInstall 

nvim "+CocInstall `echo -n coc-{sh,go,explorer,snippets,pyright,lists,perl,clangd,yaml,json}`"

# CONFIGURE FINISH
