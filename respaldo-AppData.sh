#!/bin/bash

temp_dir_2=~/tmp_backup_2

while true; do
    echo "Menú:"
    echo ""
    echo -e "1. \e[32mHacer respaldo de una carpeta desde /AppData\e[0m"
    echo -e "2. \e[32mRestaurar respaldo\e[0m"
    echo -e "3. \e[32mSalir\e[0m"

    read -p "Seleccione una opción (1-3): " choice

    case $choice in
        1)
            echo -e "\nCarpetas actuales en /data/data/com.termux/files/usr/glibc/wine-ge-custom-8-25/.wine/drive_c/users/u0_a383/AppData/:"
            ls -1 /data/data/com.termux/files/usr/glibc/wine-ge-custom-8-25/.wine/drive_c/users/u0_a383/AppData/
            read -p "Ingrese el número correspondiente a la carpeta que desea respaldar: " folder_number
            folders=($(ls -1 /data/data/com.termux/files/usr/glibc/wine-ge-custom-8-25/.wine/drive_c/users/u0_a383/AppData/))
            selected_folder=${folders[$((folder_number - 1))]}
            
            mkdir -p $temp_dir_2
            
            rsync -av --progress "/data/data/com.termux/files/usr/glibc/wine-ge-custom-8-25/.wine/drive_c/users/u0_a383/AppData/$selected_folder" $temp_dir_2/
            echo -e "\nRespaldo de $selected_folder completado en $temp_dir_2/"
            ;;
        2)
            echo -e "\nRespaldos disponibles en ~/tmp_backup_2/:"
            ls -1 $temp_dir_2
            read -p "Ingrese el nombre del respaldo que desea restaurar: " restore_folder_2
            rsync -av --progress $temp_dir_2/"$restore_folder_2" "/data/data/com.termux/files/usr/glibc/wine-ge-custom-8-25/.wine/drive_c/users/u0_a383/AppData/"
            echo -e "\nRestauración de $restore_folder_2 completada en /data/data/com.termux/files/usr/glibc/wine-ge-custom-8-25/.wine/drive_c/users/u0_a383/AppData/"
            ;;
        3)
            echo "Saliendo del script."
            exit 0
            ;;
        *)
            echo "Opción no válida. Por favor, seleccione 1, 2, o 3."
            ;;
    esac

    echo -e "\n---------------------------------\n"
done
