#!/bin/bash

# Directorio temporal en el directorio de inicio del usuario
temp_dir=~/tmp_backup

while true; do
    echo "Menú:"
    echo "1. Hacer respaldo de una carpeta"
    echo "2. Guardar respaldo en /sdcard/ o /sdcard/archives/"
    echo "3. Salir"

    read -p "Seleccione una opción (1-3): " choice

    case $choice in
        1)
            echo -e "\nCarpetas actuales en /data/data/com.termux/files/usr/glibc/wine-ge-custom-8-25/.wine/drive_c/users/u0_a383/AppData/Roaming/:"
            ls -1 /data/data/com.termux/files/usr/glibc/wine-ge-custom-8-25/.wine/drive_c/users/u0_a383/AppData/Roaming/
            read -p "Ingrese el número correspondiente a la carpeta que desea respaldar: " folder_number
            folders=($(ls -1 /data/data/com.termux/files/usr/glibc/wine-ge-custom-8-25/.wine/drive_c/users/u0_a383/AppData/Roaming/))
            selected_folder=${folders[$((folder_number - 1))]}
            
            # Crear directorio temporal si no existe
            mkdir -p $temp_dir
            
            rsync -av --progress "/data/data/com.termux/files/usr/glibc/wine-ge-custom-8-25/.wine/drive_c/users/u0_a383/AppData/Roaming/$selected_folder" $temp_dir/
            echo -e "\nRespaldo de $selected_folder completado en $temp_dir/"
            ;;
        2)
            echo "Seleccione la ubicación para guardar el respaldo:"
            echo "1. /sdcard/"
            echo "2. /sdcard/archives/"
            read -p "Ingrese el número correspondiente a la ubicación (1 o 2): " backup_location
            if [ "$backup_location" == "1" ]; then
                rsync -av --progress $temp_dir/ "/sdcard/"
            elif [ "$backup_location" == "2" ]; then
                rsync -av --progress $temp_dir/ "/sdcard/archives/"
            else
                echo "Opción no válida. Por favor, seleccione 1 o 2."
            fi
            ;;
        3)
            echo "Saliendo del script."
            exit 0
            ;;
        *)
            echo "Opción no válida. Por favor, seleccione 1, 2 o 3."
            ;;
    esac

    echo -e "\n---------------------------------\n"
done
