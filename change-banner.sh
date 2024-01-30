#!/data/data/com.termux/files/usr/bin/bash
clear
source ~/.termux-dev/env/env.sh
source ~/.termux-dev/env/config.sh
echo -e "\e[92mEste script convierte una imagen a portada En:\e[0m \e[93mtermux-dev\e[0m"
echo -e "\e[92mAsegurate de tener la imagen en el directorio actual\e[0m"
echo""
echo -e "
                ${red}${bred}${white}  Retired64 On Youtube  ${bblack}${red}

                      ${white}${bwhite}${black}   📱🎮📱   ${bblack}${white}
"
if ! command -v jp2a &>/dev/null; then
    echo -e "\e[92mInstalando jp2a...\e[0m"
    yes|pkg install jp2a -y &>/dev/null || { echo -e "\e[91mError al instalar jp2a\e[0m"; exit 1; }
fi

if ! command -v convert &>/dev/null; then
    echo ""
    echo -e "\e[92mInstalando imagemagick...\e[0m"
    yes|pkg install imagemagick -y &>/dev/null || { echo -e "\e[91mError al instalar imagemagick\e[0m"; exit 1; }
fi

read -p $'\e[96mIngresa el nombre de la imagen:\e[0m ' imagen

if [ -z "$imagen" ]; then
    echo -e "\e[91mError: Debes ingresar un nombre de imagen\e[0m"
    exit 1
fi

read -p $'\e[96mIngresa el tamaño de la imagen:\e[0m ' size

convert "$imagen" -resize "$size" - | jp2a --color - > termux-dev.txt || { echo -e "\e[91mError al convertir la imagen\e[0m"; exit 1; }
sleep 1
echo -e "\e[92mLa imagen se ha guardado como:\e[0m \e[96mtermux-dev.txt\e[0m "
mv .termux-dev/custom/termux-dev.txt termux-dev.bak
cp termux-dev.txt .termux-dev/custom/termux-dev.txt
echo -e "\e[92mPor favor, sal de la terminal y vuelve a entrar para ver los cambios realizados con éxito\e[0m"

while true; do
    read -p $'\e[96m¿Deseas restaurar el archivo de respaldo? (s/n):\e[0m ' restore
    case $restore in
        [Ss]* ) mv termux-dev.bak .termux-dev/custom/termux-dev.txt; echo -e "\e[92mRestauración completada\e[0m"; break;;
        [Nn]* ) echo -e "\e[92mNo se ha realizado ninguna restauración\e[0m"; break;;
        * ) echo -e "\e[91mPor favor, responde 's' o 'n'\e[0m";;
    esac
done
