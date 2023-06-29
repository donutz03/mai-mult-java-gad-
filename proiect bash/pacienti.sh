#!/bin/bash

# Numele fisierului de pacienti
pacienti_csv="pacienti.csv"
# touch actualizeaza marca temporala a fisierului daca acesta exista sau il creeaza daca acesta nu exista
touch pacienti.csv



# Functie pentru afisarea meniului de optiuni
afiseaza_meniu () {
  echo "Alege optiunea: "
  echo "1. Adauga un nou pacient"
  echo "2. Sterge un pacient"
  echo "3. Afiseaza pacienti"
  echo "4. Actualizeaza datele unui pacient"
  echo "5. Iesire"
}

#afiseaza_meniu
# test functie afiseaaza_meniu merge

# Functie pentru generarea unui ID nou prin incrementarea celui mai mare ID disponibil
genereaza_id_nou() {
  # sed: expresia regulata se afla intre apostrofuri
  # $(...) atribui rezultatul comenzii dintre paranteze variabilei ultimul_id, in cazul acesta rezultatul comenzii sed
  # -n suprima afisarea implicita a sed
  # adica daca folosesc -n, sed -n nu afiseaza nimic
  # in interiorul comenzii sed, $ specifica faptul ca expresia regulata se aplica doar ultimei linii
  # s vine de la substitute si este urmat de delimitatori /... / ... / care specifica ce se inlocuieste cu ce
  # caracterul ^ specifica ca se cauta de la inceputul liniei
  # caracterul ^ folosit intre paranteze drepte [] semnifica negare, not: [^]
  # punctul . semnifica orice caracter 
  # Steluta * semnifica orice caracter care apare de 0 sau mai multe ori
  # \1 reprezinta numarul grupului de captura, in cazul acesta am un singur grup de captura, anume
  # \([^,]\) nu virgula si practic \1 stocheaza rezultatul grupului asta de captura
  # optiunea /p afiseaza doar liniile inlocuite  
  ultimul_id=$(sed -n '$s/^\([^,]*\).*/\1/p' "$pacienti_csv")
  if [[ -z $ultimul_id  ]]
    then
      echo 1 # daca ultimul_id este un sir de caractere gol, atunci afiseaza 1, adica id-ul care urmeaza sa fie introdus va avea valoarea 1
    else
      echo $((ultimul_id + 1))
  fi
}

# genereaza_id_nou pacienti_csv 
# genereaza_id_nou medicamente_csv
# testul merge, cand date.csv este gol atunci afiseaza 1
# dar date.csv trebuie sa fie creat intai

# Functie pentru adaugarea unei inregistrari noi

cnp_valid() {
local cnp=$1
if [[ ${#cnp} -ne 13 ]]
  then
    echo "CNP invalid. CNP-ul trebuie sa aiba exact 13 cifre."
    return 0
  elif ! [[ $cnp =~ ^[0-9]+$ ]]
    then 
      echo "CNP invalid. CNP-ul trebuie sa contina doar cifre."
      return 0
fi
return 1
}

numar_telefon_valid() {
local numartelefon=$1
if [[ ${#numartelefon} -ne 10 ]]
  then 
    echo "Numar telefon invalid. Numarul de telefon trebuie sa aiba exact 10 cfire."
    return 0
  elif ! [[ $numartelefon =~ ^[0-9]+$ ]]
    then
      echo "Numar de telefon invalid. Numarul de telefon trebuie sa contina doar cifre."
      return 0
fi
return 1
}

adaugare_pacient() {
id=$(genereaza_id_nou)
echo "Introduceti numele:"
read nume
echo "Introduceti prenumele:"
read prenume
cnp_valid=false
    while [[ $cnp_valid != true ]]; do
        echo "Introduceti CNP-ul pacientului:"
        read cnp
        if ! cnp_valid "$cnp"; then
            echo "Introduceti CNP-ul corect."
        else
            cnp_valid=true
        fi
    done
telefon_valid=false
    while [[ $telefon_valid != true ]]; do
        echo "Introduceti numarul de telefon al pacientului:"
        read numartelefon
        if ! numar_telefon_valid "$numartelefon"; then
            echo "Introduceti numarul de telefon corect."
        else
            telefon_valid=true
        fi
    done
echo "Introduceti adresa:"
read adresa
echo "$id,$nume,$prenume,$cnp,$numartelefon,$adresa" >> "$pacienti_csv"
echo "Inregistrare adaugata cu succes."
}

# adaugare_inregistrare
# test adaugare_inregistrare, merge, adauga in $fisier_csv, adica date.csv intrarile in formatul
# id,nume,prenume,nota

# Functie pentru stergerea unei inregistrari dupa ID

stergere_pacient() {
  echo "Introdu ID-ul pacientului pe care vrei sa il stergi:"
  read id
  # grep -v afiseaza toate rezultatele care nu contin ce se cauta
  # grep -q cauta in mod silentios (quiet), rezultatele cautarii nu se afiseaza in terminal
  # daca un sablon este gasit cu grep -q atunci comanda returneaza 0, iar daca un sablon nu este gasit cu grep -q, comanda returneaza ceva diferit de 0 
 if grep -q "^$id," "$pacienti_csv"
    then
      grep -v "^$id," "$pacienti_csv" > temp.csv
      mv temp.csv "$pacienti_csv"
      echo "Inregistrare stearsa cu succes."
    else
      echo "ID-ul introdus nu exista in baza de date cu pacientii."
  fi
}

afisare_pacienti() {
  echo "Baza de date contine urmatorii pacienti:"
  echo "ID, Nume, Prenume, CNP, Numar de telefon, Adresa"
  cat "$pacienti_csv"
}

# adaugare_inregistrare
# afisare_inregistrari
# test ca inregistrarile se afiseaza pe ecran, merge

actualizare_pacient() {
  echo "Introduceti ID-ul pacientului ale carui date vrei sa le actualizezi:"
  read id
  pacient=$(grep "^$id," "$fisier_csv")
  if [[ -z $pacient ]]
    then 
      echo "Nu exista un pacient cu ID-ul specificat."
    else
      echo "Pacient gasit: $pacient"
      echo "Introdu noile date separate prin virgula:"
      read date_noi
      # sed -i inlocuieste direct in fisier regexul
      sed -i "s/^$id,.*/$id,$date_noi/" "$fisier_csv"
      echo "Inregistrare actualizata cu succes"
      fi
}

# actualizare_inregistrare
# testul merge, inregistrarea se actualizeaza

# Meniul principal

while true 
  do
    afiseaza_meniu
    echo "Introdu optiunea:"
    read optiune

    case $optiune in
      1) adaugare_pacient;;
      2) stergere_pacient;;
      3) afisare_pacienti;;
      4) actualizare_pacient;;
      5) echo "La revedere!"; break;;
      *) echo "Optiune invalida.";;
    esac

    # afiseaza o linie goala inainte ca meniul sa se reia
    echo

  done

