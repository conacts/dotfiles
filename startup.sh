#!/bin/bash

# Function to install Homebrew on macOS
install_brew() {
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

# Function to install packages on macOS
install_macos_packages() {
    echo "Installing packages on macOS..."
    brew install git neovim tmux htop tree neofetch python3 openvpn
    brew install --cask karabiner-elements
}

# Function to update Arch Linux
update_arch() {
    echo "Updating Arch Linux..."
    sudo pacman -Syyu
}

# Function to install packages on Arch Linux
install_arch_packages() {
    echo "Installing packages on Arch Linux..."
    sudo pacman -S git neovim tmux htop tree neofetch python openvpn openssh yay
}

# Function to update Debian-based Linux distributions
update_debian() {
    echo "Updating Debian-based Linux..."
    sudo apt update && sudo apt upgrade -y
}

# Function to install packages on Debian-based Linux distributions
install_debian_packages() {
    echo "Installing packages on Debian-based Linux..."
    sudo apt install -y git neovim tmux htop tree neofetch python3 python3-pip openvpn openssh-server
}

# Function to clone the specified repositories for macOS
clone_macos_repositories() {
    echo "Cloning macOS repositories..."
    local target_dir=~/.config/karabiner/assets/complex_modifications
    if [ -e "$target_dir" ]; then
        mv "$target_dir" "$target_dir.bak"
    fi
    git clone https://github.com/conacts/karabiner "$target_dir"
}

# Function to clone the specified repositories for Neovim
clone_neovim_repository() {
    echo "Cloning Neovim repository..."
    local target_dir=~/.config/nvim
    if [ -e "$target_dir" ]; then
        mv "$target_dir" "$target_dir.bak"
    fi
    git clone https://github.com/conacts/neovim "$target_dir"
    echo "Cloning packer.nvim..."
    local packer_dir=~/.local/share/nvim/site/pack/packer/start/packer.nvim
    if [ -e "$packer_dir" ]; then
        mv "$packer_dir" "$packer_dir.bak"
    fi
    git clone --depth 1 https://github.com/wbthomason/packer.nvim "$packer_dir"
}

# Function to clone Tmux Plugin Manager (tpm)
clone_tmux_tpm() {
    echo "Cloning Tmux Plugin Manager (tpm)..."
    local target_dir=~/.tmux/plugins/tpm
    if [ -e "$target_dir" ]; then
        mv "$target_dir" "$target_dir.bak"
    fi
    git clone https://github.com/tmux-plugins/tpm "$target_dir"
}

# Function to move dotfiles to their proper directories
move_dotfiles() {
    echo "Moving dotfiles..."
    local config_dir="$(pwd)/config"
    local dotfiles={".bashrc" ".tmux.conf" ".vimrc" ".zshrc"}
    
    for file in "${dotfiles[@]}"; do
        local target_file="$HOME/$file"
        if [ -e "$target_file" ]; then
            mv "$target_file" "$target_file.bak"
        fi
        mv "$config_dir/$file" "$HOME"
    done
}

# Check the operating system and perform the appropriate action
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    echo "Detected macOS"
    if [ -x "$(command -v brew)" ]; then
        echo "Homebrew is already installed"
    else
        install_brew
    fi
    install_macos_packages
    clone_macos_repositories
    move_dotfiles
elif [ -f "/etc/arch-release" ]; then
    # Arch Linux
    echo "Detected Arch Linux"
    update_arch
    install_arch_packages
    clone_neovim_repository
    clone_tmux_tpm
    move_dotfiles
elif [ -f "/etc/debian_version" ] || [ -f "/etc/debian_release" ]; then
    # Debian-based Linux
    echo "Detected Debian-based Linux"
    update_debian
    install_debian_packages
    clone_neovim_repository
    clone_tmux_tpm
    move_dotfiles
else
    echo "Unsupported operating system"
fi
