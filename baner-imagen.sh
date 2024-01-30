#!/bin/bash

if ! command -v jp2a &>/dev/null; then
    echo -e "\e[92mInstalando jp2a...\e[0m"
    yes|pkg install jp2a -y &>/dev/null
fi

if ! command -v imagemagick &>/dev/null; then
    echo ""
    echo -e "\e[92mInstalando imagemagick...\e[0m"

    yes|pkg install imagemagick -y &>/dev/null
fi
sleep 1
# Solicitar al usuario el nombre de la imagen
read -p $"\e[96mIngresa el nombre de la imagen:\e[0m " imagen
read -p $"\e[96mIngresa el tamaño de la imagen:\e[0m " size

# Convertir la imagen a ASCII y guardarla en un archivo de texto
convert "$imagen" -resize "$size" - | jp2a --color - > termux-dev.txt
sleep 1
echo -e "\e[92mLa imagen se a guardado como:\e[0m \e[96mtermux-dev.txt\e[0m "
mv .termux-dev/custom/termux-dev.txt termux-dev.bak
cp termux-dev.txt .termux-dev/custom/termux-dev.txt
echo -e "\e[92mSal de la terminal y vuelve a entrar para ver los cambios realizados con exito\e[0m"

