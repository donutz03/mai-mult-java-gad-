# Functie pentru plasarea unei comenzi
plaseaza_comanda() {
  # Numele fisierului de comenzi
  comenzi_csv="comenzi.csv"

  echo "Introduceti ID-ul pacientului:"
  read pacient_id
  echo "Introduceti ID-ul medicamentului:"
  read medicament_id
  echo "Introduceti cantitatea:"
  read cantitate

  # Verificarea disponibilitatii medicamentului in stoc
  disponibil=$(grep "^$medicament_id," "$medicamente_csv" | cut -d',' -f8)
  if [[ -z $disponibil ]]; then
    echo "ID-ul medicamentului introdus nu exista in baza de date."
    return
  fi

  if [[ $disponibil -ge $cantitate ]]; then
    # Obținerea informațiilor despre pacient din baza de date
    pacient_info=$(grep "^$pacient_id," "$pacienti_csv")
    if [[ -z $pacient_info ]]; then
      echo "ID-ul pacientului introdus nu exista in baza de date."
      return
    fi

    # Obținerea informațiilor despre medicament din baza de date
    medicament_info=$(grep "^$medicament_id," "$medicamente_csv")
    if [[ -z $medicament_info ]]; then
      echo "ID-ul medicamentului introdus nu exista in baza de date."
      return
    fi

    # Extrage valorile relevante din informațiile despre pacient și medicament
    nume_pacient=$(echo "$pacient_info" | cut -d',' -f2)
    prenume_pacient=$(echo "$pacient_info" | cut -d',' -f3)
    cnp_pacient=$(echo "$pacient_info" | cut -d',' -f4)
    nume_medicament=$(echo "$medicament_info" | cut -d',' -f2)

    # Adaugarea comenzii in baza de date comenzi
    id_comanda=$(genereaza_id_nou "$comenzi_csv")
    echo "$id_comanda,$nume_pacient,$prenume_pacient,$cnp_pacient,$medicament_id,$nume_medicament,$cantitate" >> "$comenzi_csv"
    echo "Comanda plasata cu succes."
  else
    echo "Nu exista suficiente medicamente disponibile in stoc."
  fi
}
