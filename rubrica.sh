#!bin/bash


#verifica se esiste rubrica.txt
if [ ! -f $rubrica.txt ]; then
    touch $rubrica.txt
fi


function add_rubrica {
    echo "Inserisci nome "
    read nome
    echo "Inserisci cognome"
    read cognome
    echo "Inserisci n.telefono: "
    read tel
    echo "Inserisci citta': "
    read citta
    echo "$nome $cognome $tel $citta" >> $rubrica.txt
}

function search_rubrica {
    echo "Ricerca per cognome: "
    read cognome
    grep -i "$cognome" $rubrica.txt || echo "ATTENZIONE!!! non e' stato trovato il contatto: $cognome"
}

function modifica_contatto {
    echo "Inserisci contatto da modificare: "
    read nome
    sed -i "/$nome/d" $rubrica.txt
    echo "Metti dati nuovi (nome cognome tel citta): "
    read c_aggiornato
    echo "$c_aggiornato" >> $rubrica.txt
}

function cancella {
    echo "Inserisci contatto da cancellare: "
    read nome
    sed -i "/$nome/d" $rubrica.txt
}

function stampa_tutti {
    sort -k1 $rubrica.txt
}

#input dall'utente
while true; do
    echo "----------------------------------"
    echo "            MENU"
    echo "----------------------------------"
    echo "1. Aggiungi"
    echo "2. Ricerca contatto tramite cognome"
    echo "3. Modifica contatto"
    echo "4. Cancelli contatto"
    echo "5. Stampa tutti"
    echo "6. Exit"
    echo "----------------------------------"
    read -p "Scegli numero: " scelta
    case $scelta in
        1) add_rubrica ;;
        2) search_rubrica ;;
        3) modifica_contatto ;;
        4) cancella ;;
        5) stampa_tutti ;;
        6) break ;;
        *) echo "Invalido" ;;
    esac
done
