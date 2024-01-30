#!/bin/bash

echo -e "\e[32mInstalando NeoVim Termux..\e[0m"

yes|pkg install git neovim clang yarn lua-language-server python -y
sleep 1
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
sleep 1
echo -e "\e[92mProceso Finalizado\e[0m"
echo -e "\e[92mPuedes Usar:\e[0m '\e[91mnvim\e[0m'"

