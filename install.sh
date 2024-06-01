#!/bin/bash
mkdir "${HOME}/Documents/tools/"
sudo apt update

packages=("fzf" "fd-find" "zsh" "nala" "vim" "zsh-autosuggestions")

# Fonction pour vérifier si un package peut être installé
check_install() {
    package="$1"
    if ! sudo apt-get install -y "$package"; then
        echo "Erreur: Impossible d'installer le package $package"
        exit 1
    fi

# Boucle pour installer chaque package
for package in "${packages[@]}"; do
    echo "Installation du package $package..."
    check_install "$package"
    echo "Installation du package $package terminée."
done

echo "Tous les packages ont été installés avec succès."
chsh -s /usr/bin/zsh
/usr/bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -sS https://starship.rs/install.sh | sh
cp .fzf_env "${HOME}/.fzf_env"
cp .fzf-zsh "${HOME}/.fzf-zsh"
cp .zshrc "${HOME}/.zshrc"
cp docker-aliases.sh "${HOME}/.docker-aliases.sh"
source .zshrc
git clone https://github.com/Aloxaf/fzf-tab "${HOME}/Documents/tools/fzf-tab"