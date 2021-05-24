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

NVIM_PROG="$NVIM_DIR"/bin/nvim

[[ -d ~/dotFiles ]] ||
    git clone https://github.com/driverCzn/dotFiles ~/dotFiles

# [[ -d ~/dotFiles ]] &&
#     cd ~/dotFiles
