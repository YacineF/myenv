mkdir "${HOME}/Documents/tools/"
sudo apt install fzf fdfind zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -sS https://starship.rs/install.sh | sh
cp .fzf_env "${HOME}/.fzf_env"
cp .fzf-zsh "${HOME}/.fzf-zsh"
cp .zshrc "${HOME}/.zshrc"
cp docker-aliases.sh "${HOME}/docker-aliases.sh"
source .zshrc
git clone https://github.com/Aloxaf/fzf-tab "${HOME}/Documents/tools/fzf-tab"