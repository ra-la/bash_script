#!/bin/bash

# Vérification des permissions root
if [[ $EUID -ne 0 ]]; then
    echo "Ce script doit être exécuté en tant qu'administrateur (root)."
    exit 1
fi

# Mise à jour des paquets Ubuntu
echo "Mise à jour des paquets Ubuntu"
sudo apt update && sudo apt upgrade -y

# Nettoyage des paquets inutilisés
echo "Nettoyage des paquets inutilisés"
sudo apt autoremove -y
sudo apt autoclean

# Vérification et mise à jour de WSL via PowerShell
echo "=== Vérification des mises à jour de WSL ==="
if [ -f "/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe" ]; then
    echo "PowerShell est disponible, mise à jour de WSL..."
    /mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe wsl --update
else
    echo "PowerShell n'est pas disponible. Impossible de mettre à jour WSL depuis ce script."
fi


# Vérification des versions après mise à jour
echo "Version d'Ubuntu"
lsb_release -a

echo "Version du WSL"
uname -r

echo "Mise à jour terminée"
