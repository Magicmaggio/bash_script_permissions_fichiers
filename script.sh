#!/bin/bash

# Vérifier si le dossier "test-dossier" existe déjà et créer un nom unique
dossier="test-dossier"
i=1
while [ -d "$dossier" ]; do
    dossier="test-dossier_$i"
    i=$((i + 1))
done
mkdir -p "$dossier"

# On crée le dossier "test-dossier"
mkdir -p "$dossier"

# On crée le "fichier1" puis 2 puis 3 avec les permissions demandées puis on les ajoute au dossier test-dossier_*
touch "$dossier/fichier1" && chmod 600 "$dossier/fichier1"
touch "$dossier/fichier2" && chmod 444 "$dossier/fichier2"
touch "$dossier/fichier3" && chmod 755 "$dossier/fichier3"

# On affiche le contenu du dossier test-dossier avec les permissions accordées
ls -lt "$dossier"

# On propose à l'utilisateur de supprimer le dossier et tous les fichiers créés
read -p "gros, tu veux tout delete ? (o/n)" rep
if [[ "$rep" == "o" || "$rep" == "O" ]]; then
    rm -rf test-dossier*
    echo "Deleted."
else
    echo "No deleted."
fi 
