#!/bin/bash

# Créer le répertoire tools dans Documents
mkdir -p "${HOME}/Documents/tools/"

# Mettre à jour les dépôts
sudo dnf update -y

# Liste des packages à installer
packages=("fzf" "fd-find" "zsh" "vim" "zsh-autosuggestions" "git" "curl")

# Fonction pour vérifier si un package peut être installé
check_install() {
    package="$1"
    if ! sudo dnf install -y "$package"; then
        echo "Erreur: Impossible d'installer le package $package"
        exit 1
    fi
}

# Boucle pour installer chaque package
for package in "${packages[@]}"; do
    echo "Installation du package $package..."
    check_install "$package"
    echo "Installation du package $package terminée."
done

# Copier les fichiers de configuration
echo "Copie des fichiers de configuration..."
cp .fzf_env "${HOME}/.fzf_env"
cp .fzf-zsh "${HOME}/.fzf-zsh"
cp .zshrc "${HOME}/.zshrc"
cp docker-aliases.sh "${HOME}/.docker-aliases.sh"

# Charger la configuration zsh
echo "Chargement de la configuration zsh..."
source "${HOME}/.zshrc"

# Cloner le dépôt fzf-tab
echo "Clonage du dépôt fzf-tab..."
git clone https://github.com/Aloxaf/fzf-tab "${HOME}/Documents/tools/fzf-tab"

# Changer le shell par défaut en zsh
echo "Changement du shell par défaut en zsh..."
chsh -s /usr/bin/zsh

