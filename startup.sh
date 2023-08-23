#!/bin/bash

### Global Section ###
VERBOSE=${VERBOSE:-0}

log() {
    if [ "$VERBOSE" -eq 1 ]; then
        echo "$@"
    fi
}

move_dotfiles() {
    log "Moving dotfiles..."
    local config_dir="./config"
    if [ -d "$config_dir" ]; then
        for file in "$config_dir"/.*; do
            if [ -f "$file" ]; then
                local filename=$(basename "$file")
                local destination="$HOME/$filename"
                if [ -e "$destination" ]; then
                    log "Conflict: File '$filename' already exists in the destination. Renaming to '$filename.bak'"
                    mv "$destination" "$destination.bak"
                fi
                log "Moving '$filename' to '$HOME/'"
                cp "$file" "$HOME/"
            fi
        done
    else
        log "Error: 'dotfiles/config' directory not found or is not a directory."
        exit 1
    fi
}

clone_neovim_repository() {
    log "Cloning Neovim repository..."
    local target_dir=~/.config/nvim
    if [ -e "$target_dir" ]; then
        mv "$target_dir" "$target_dir.bak"
    fi
    git clone https://github.com/conacts/neovim "$target_dir"
    log "Cloning packer.nvim..."
    local packer_dir=~/.local/share/nvim/site/pack/packer/start/packer.nvim
    if [ -e "$packer_dir" ]; then
        mv "$packer_dir" "$packer_dir.bak"
    fi
    git clone --depth 1 https://github.com/wbthomason/packer.nvim "$packer_dir"
}

clone_tmux_tpm() {
    log "Cloning Tmux Plugin Manager (tpm)..."
    local target_dir=~/.tmux/plugins/tpm
    if [ -e "$target_dir" ]; then
        mv "$target_dir" "$target_dir.bak"
    fi
    git clone https://github.com/tmux-plugins/tpm "$target_dir"
}


### macOS Section ###
install_brew() {
    log "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

install_macos_packages() {
    log "Installing packages on macOS..."
    brew install git neovim tmux htop tree neofetch python3 openvpn
    brew install --cask karabiner-elements
}

macos_configuration() {
    log "Configuring macOS..."
    defaults write com.apple.desktopservices DSDoneWriteNetworkStores true
    defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
}

clone_macos_repositories() {
    log "Cloning macOS repositories..."
    local target_dir=~/.config/karabiner/assets/complex_modifications
    if [ -e "$target_dir" ]; then
        mv "$target_dir" "$target_dir.bak"
    fi
    git clone https://github.com/conacts/karabiner "$target_dir"
}


### Ubuntu/Debian Section ###
update_debian() {
    log "Updating Debian-based Linux..."
    sudo apt update
}

add_debian_ppas() {
    log "Adding PPAs on Debian-based Linux..."
    sudo add-apt-repository -y ppa:neovim-ppa/unstable
    sudo apt update
}

install_debian_packages() {
    log "Installing packages on Debian-based Linux..."
    sudo apt install -y git neovim tmux htop tree neofetch python3 python3-pip openvpn openssh-server
}


### Arch Section ###
update_arch() {
    log "Updating Arch Linux..."
    sudo pacman -Syyu
}

install_arch_packages() {
    log "Installing packages on Arch Linux..."
    sudo pacman -S git neovim tmux htop tree neofetch python openvpn openssh yay
}


### Operating System Detection and Execution ###
if [[ "$OSTYPE" == "darwin"* ]]; then
    log "Detected macOS"
    if [ -x "$(command -v brew)" ]; then
        log "Homebrew is already installed"
    else
        install_brew
    fi
    install_macos_packages
    macos_configuration
    clone_macos_repositories
    move_dotfiles

elif [ -f "/etc/arch-release" ]; then
    log "Detected Arch Linux"
    update_arch
    install_arch_packages
    clone_neovim_repository
    clone_tmux_tpm
    move_dotfiles

elif [ -f "/etc/debian_version" ] || [ -f "/etc/debian_release" ]; then
    log "Detected Debian-based Linux"
    update_debian
    add_debian_ppas
    install_debian_packages
    clone_neovim_repository
    clone_tmux_tpm
    move_dotfiles

else
    log "Unsupported operating system"
fi
