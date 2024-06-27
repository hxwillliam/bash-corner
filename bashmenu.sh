#!/bin/bash

bin_dir="$HOME/bin"

sposta_in_cestino() {
    echo "INSERISCI PERCORSO FILE:"
    read file_path
    if [ ! -d "$bin_dir" ]; then
        mkdir "$bin_dir"
    fi
    mv "$file_path" "$bin_dir"
    echo "FILE SPOSATO NEL CESTINO."
}

visualizza_cestino() {
    ls "$bin_dir"
}

ripristina_file() {
    echo "INSERISCI NOME FILE DA RECUPERARE:"
    read file_name
    mv "$bin_dir/$file_name" .
    echo "RICOVERATO FILE."
}

svuota_cestino() {
    rm -r "$bin_dir"
    echo "SVUOTATO CESTINO."
}

while true; do
    echo "MENU:"
    echo "1) SPOSTA FILE NEL CESTINO"
    echo "2) VISUALIZZA CESTINO"
    echo "3) RIPRISTINA FILE DAL CESTINO"
    echo "4) SVUOTA CESTINO"
    echo "5) Exit"
    read -p "INSERISCI LA TUA SCELTA: " scelta
    case $scelta in
        1) sposta_in_cestino ;;
        2) visualizza_cestino ;;
        3) ripristina_file ;;
        4) svuota_cestino ;;
        5) break ;;
        *) echo "Invalida." ;;
    esac
done