#!/bin/bash

# Variables numériques
a=20
b=4
somme=$((a + b))

# Variables texte
nom="Bash"
utilisateur=$USER

# Commandes
repertoire_courant=$(pwd)
nombre_fichiers=$(ls | wc -l)

# Afficher les résultats
echo "Bonjour, $utilisateur !"
echo "Bienvenue dans le script $nom."
echo "Le répertoire actuel est : $repertoire_courant"
echo "Il y a $nombre_fichiers fichiers dans ce répertoire."
echo "Et au fait, $a + $b = $somme !"

