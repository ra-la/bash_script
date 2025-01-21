#!/bin/bash

# Demande le nom de l'utilisateur
read -p "Nom de l'utilisateur : " username

# Crée l'utilisateur et son répertoire personnel
useradd -m $username

# Demande du mot de passe de l'utilisateur (caché)
read -sp "Mot de passe pour $username : " password


# Configure le mot de passe de l'utilisateur
echo "$username:$password" | chpasswd  # Utilisation de chpasswd pour définir le mot de passe de manière sécurisée

# Crée un répertoire "workspace" pour l'utilisateur
mkdir /home/$username/workspace

# Assure que l'utilisateur est propriétaire du répertoire workspace
chown $username:$username /home/$username/workspace

# Définit des permissions strictes (seul l'utilisateur a accès)
chmod 700 /home/$username/workspace

# Message de confirmation
echo "Utilisateur $username créé avec succès."

