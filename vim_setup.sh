#!/usr/bin/env bash

setup() {
    # Navigates to `HOME Directory` to increase success rate
    cd || { echo "could not navigate to HOME Directory" >&2; return 2; }
    # Installs the `vim editor` if it doesn't exist
    if [[ -z "$(which vim)" ]]; then
        sudo apt update && sudo apt install vim -y
    fi
    # Downloads the vim config file
    curl -SL https://raw.githubusercontent.com/tiagopog/vimfiles/master/vimrc -o ~/.vimrc
    if [[ $? -ne 0 ]]; then
        return 2
    fi
    # Clones Vundle.vim
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    # Installs the plugins
    vim -c "PluginInstall" -c "qall"
    
    # Provides a colorscheme.txt file
    gen_colorscheme
}

gen_colorscheme() {
    for color in ~/.vim/bundle/vim-colorschemes/colors/*.vim; do
        if [[ ! -f "$color" ]]; then
            continue
        fi
        basename "$color" .vim
    done | column -c 60 -x > ~/.vim/colorscheme.txt
}

# main
setup && echo "vim setup -> [successful]"

