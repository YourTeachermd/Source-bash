#!/bin/bash

echo -e "\e[92mIngrese la carpeta que desea buscar\e[0m"
echo -e "\e[96mRespetando mayúsculas y minúsculas de su carpeta\e[0m"

read -p " > " folder

# Encuentra la carpeta
result=$(find $PREFIX/glibc/ -type d -name "$folder" -print -quit)

if [ -z "$result" ]; then
    echo "No se encontró la carpeta."
else
    # Lista el contenido de la carpeta encontrada
    echo -e "\e[92mContenido de la carpeta encontrada:\e[0m"
    (cd "$result" && ls -l)

    echo -e "\e[92m¿Quieres copiar o mover alguna carpeta? (c/m/n)\e[0m"
    read -p " > " option

    case $option in
        c)  echo -e "\e[92mIngrese el nombre de la carpeta a copiar\e[0m"
            read -p " > " copy_folder
            cp -r "$result/$copy_folder" /sdcard/Downloads/
            echo "Carpeta copiada con éxito."
            ;;
        m)  echo -e "\e[92mIngrese el nombre de la carpeta a mover\e[0m"
            read -p " > " move_folder
            mv "$result/$move_folder" /sdcard/Downloads/
            echo "Carpeta movida con éxito."
            ;;
        n)  echo "No se realizó ninguna acción."
            ;;
        *)  echo "Opción no válida."
            ;;
    esac
fi
