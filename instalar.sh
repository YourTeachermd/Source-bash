#!/bin/bash
red='\e[91m'
blue='\e[96m'
green='\e[92m'
r='\e[0m'
echo -e "${green}Welcome to path External${r}"
read -p $'\e[96mIngresa Ruta de Tu Memoria: \e[0m' external
read -p $'\e[96mIngresa tu wine: \e[0m' wine
read -p $'\e[96mIngresa Nombre de Tu Nueva Carpeta: \e[0m' name
sleep 1
ln -s $external $PREFIX/glibc/$wine/.wine/drive_c/$name
