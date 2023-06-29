#!/bin/bash

# Functie pentru afisarea meniului principal principal
afiseaza_meniu_principal() {
    echo "Meniu Principal:"
    echo "1. Deschide meniu baza de date medicamente"
    echo "2. Deschide meniu baza de date pacienti"
    echo "3. Iesire"
}

while true; do
    afiseaza_meniu_principal
    echo "Introduceti optiunea:"
    read optiune

    case $optiune in
        1)
            echo "Deschide meniu baza de date medicamente"
            ./med.sh
            ;;
        2)
            echo "Deschide meniu baza de date pacienti"
            ./pacienti.sh
            ;;
        3)
            echo "La revedere!"
            break
            ;;
        *)
            echo "Optiune invalida."
            ;;
    esac

    echo
done
