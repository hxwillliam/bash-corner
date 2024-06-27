#!/bin/bash

echo "Inserisci username per giocare: "
read nome
if [ -z "$nome" ]; then
    echo "E' necessario inserire una username. Riprova."
    exit 1
fi

function random {
    echo $RANDOM
}

function menu {
    echo "Ciao $nome Riesci ad indovinare il numero?"
    echo "--------------------------------------------"
    echo "Il numero e' un intero positivo da 0 a 32767"
    echo "Puoi inserire -1 per lasciare"
    echo "Oppure inserisci -2 per mostrare il numero"
    echo "--------------------------------------------"
    gioco
}

function gioco {
    num=$(random)
    while true; do
        read -p "Pronto? Inserisci numero--> " usernum
        if [ $usernum -eq -1 ]; then
            echo "Hai lasciato il gioco"
            break
        elif [ $usernum -eq -2 ];then
            echo "il numero e' $num"
            break
        elif [ $usernum -eq $num ]; then
            echo "Bravo $nome, hai indovinato il numero"
            break
        else

        #logica per calcolare la differenza
            dif=$(( $num - $usernum ))
            if [ $dif -ge 1000 ]; then
                if [ $usernum -gt $num ]; then
                    echo "Troppo grande"
                else
                    echo "Troppo piccolo"
                fi
            else
                echo "Piu vicino"
            fi
        fi
    done
}

menu