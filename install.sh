#!/bin/bash

target_directory="$HOME/dotfiles"
link_directory="$HOME/.config/nvim"

if [ -d "$link_directory" ]; then
    echo "The directory $directory_to_check exists."
else
    mkdir -p $link_directory
    echo "Created $directory_to_check"
    ln -s $target_directory/nvim/init.lua $link_directory/init.lua
fi


if [ -d "$link_directory/lua" ]; then
    echo "The directory $directory_to_check exists."
else
    mkdir -p "$link_directory/lua"
    echo "Created $directory_to_check"
    ln -s $target_directory/nvim/lua/base.lua $link_directory/lua/base.lua
    ln -s $target_directory/nvim/lua/keymap.lua $link_directory/lua/keymap.lua
    ln -s $target_directory/nvim/lua/lsp_config.lua $link_directory/lua/lsp_config.lua
    ln -s $target_directory/nvim/lua/nvim_cmp_config.lua $link_directory/lua/nvim_cmp_config.lua
    ln -s $target_directory/nvim/lua/plugins.lua $link_directory/lua/plugins.lua
fi

echo "Symlink creation complete."

