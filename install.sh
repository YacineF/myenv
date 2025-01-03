#!/bin/bash
mkdir -p "${HOME}/Documents/tools/"
sudo apt update

packages=("fzf" "fd-find" "zsh" "nala" "vim" "zsh-autosuggestions")

# Fonction pour vérifier si un package peut être installé
check_install() {
    package="$1"
    if ! sudo apt-get install -y "$package"; then
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

echo "Tous les packages ont été installés avec succès."

cp .fzf_env "${HOME}/.fzf_env"
cp .fzf-zsh "${HOME}/.fzf-zsh"
cp .zshrc "${HOME}/.zshrc"
cp docker-aliases.sh "${HOME}/.docker-aliases.sh"
source "${HOME}/.zshrc"
git clone https://github.com/Aloxaf/fzf-tab "${HOME}/Documents/tools/fzf-tab"
