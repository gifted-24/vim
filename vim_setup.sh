#!/usr/bin/env bash

setup() {
    # Installs `vim editor` if it doesn't exist
    if [[ -z "$(which vim)" ]]; then
        sudo apt update && sudo apt install vim -y
    fi
    
    # Downloads the vim config file
    local vim_file="https://raw.githubusercontent.com/gifted-24/vim/main/vimrc"
    curl -SL "$vim_file" -o  ~/.vimrc
    
    # confirms if the `vim_file` file was successfully downloaded before proceeding 
    if [[ $? -ne 0 ]]; then
        echo "VimDownloadError: [$vim_file]" && return 2
    fi
    
    # Clones Vundle.vim
    git clone https://github.com/gifted-24/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    
    # Installs the plugins
    vim -c "PluginInstall" -c "qall"
}

gen_colorscheme() {
    # strips the `.vim` extension from the iterated colorschemes
    for color in ~/.vim/bundle/vim-colorschemes/colors/*.vim; do
        if [[ ! -f "$color" ]]; then
            continue
        fi
        basename "$color" .vim
    done > ~/.vim/colorscheme.txt
}

main() {
    setup
    if [[ $? -eq 0 ]]; then
        echo "Generating colorscheme -> [~/.vim/colorscheme.txt]"
        # Generates a `colorscheme.txt` file
        gen_colorscheme
        echo "vim setup -> [Successful]"
    else
        echo "vim setup -> [Failed]"
    fi
}

# executes main
main
