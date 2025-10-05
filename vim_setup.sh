#!/usr/bin/env bash

setup() {
    # Installs `vim editor` if it doesn't exist
    if [[ -z "$(which vim)" ]]; then
        sudo apt update && sudo apt install vim -y
    fi
    
    # Downloads the vim config file
    local vim_file="https://raw.githubusercontent.com/gifted-24/vim_editor/simplify-setup/vimrc -o ~/.vimrc"
    curl -SL $vim_file
    
    # confirms if the `vim_file` file was successfully downloaded before proceeding 
    if [[ $? -ne 0 ]]; then
        echo "VimDownloadError: [$vim_file]" && return 2
    fi
    
    # Clones Vundle.vim
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    
    # Installs the plugins
    vim -es -c "PluginInstall" -c "qall"
    
    # Provides a colorscheme.txt file
    gen_colorscheme
}

gen_colorscheme() {
    for color in ~/.vim/bundle/vim-colorschemes/colors/*.vim; do
        if [[ ! -f "$color" ]]; then
            continue
        fi
        basename "$color" .vim
    done > ~/.vim/colorscheme.txt
}

# main
setup
if [[ $? -eq 0 ]]; then
    echo "vim setup -> [Successful]"
else:
    "vim setup -> [Failed]"
fi

