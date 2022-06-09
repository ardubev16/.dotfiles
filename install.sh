#!/usr/bin/env bash

# Define ZDOTDIR and DOTFILES
ZDOTDIR=$HOME/.config/zsh
DOTFILES=$HOME/.dotfiles

# Define packages
packages=(
    cowsay
    bat
    fzf
    gcc
    gdb
    git
    jq
    lolcat
    make
    # neovim
    python2
    python3
    ripgrep
    stow
    thefuck
    tmux
    zsh
)

# Define stow_dirs
stow_dirs=(
    bin
    gdb 
    git
    nvim
    tmux
    zsh
)

# ============================================================================

# If we are a root in a container and `sudo` doesn't exist
# lets overwrite it with a function that just executes things passed to sudo
# (yeah it won't work for sudo executed with flags)
if ! command -v sudo &>/dev/null && whoami | grep root; then
    sudo() {
        ${*}
    }
fi

# Helper functions
log_info() {
    echo "[*] $@"
}

linux() {
    uname | grep -i Linux &>/dev/null
}
osx() {
    uname | grep -i Darwin &>/dev/null
}

not_supported() {
    echo "[!] Sorry, this distro is not yet supported!"
    exit 1
}

install_brew() {
    if ! command -v brew &>/dev/null; then
        log_info "Installing Homebrew"
        bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        log_info "Homebrew already installed"
    fi
    log_info "Installing packages with Homebrew"
    brew install ${packages[@]} antibody

    log_info "Installing Nerd-Font"
    nerd_font="hack"
    brew tap homebrew/cask-fonts && brew install --cask font-${nerd_font}-nerd-font
}

install_apt() {
    log_info "Installing packages with apt"
    sudo apt update
    sudo apt install -y ${packages[@]}
    if ! command -v antibody &>/dev/null; then
        curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin
    fi

    log_info "Installing Nerd-Font"
    nerd_font="Hack"
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/${nerd_font}.zip
    unzip ${nerd_font}.zip -d $HOME/.local/share/fonts
    rm ${nerd_font}.zip
    fc-cache -fv
}

# Install packages depending on OS
if osx; then
    log_info "Mac OS detected!"
    install_brew
elif linux; then
    distro=$(grep "^ID=" /etc/os-release | cut -d'=' -f2 | sed -e 's/"//g')
    log_info "$distro detected!"

    case $distro in
        "ubuntu")
            install_apt
            ;;
        *)
            if command -v apt &>/dev/null; then
                install_apt
            else
                not_supported
            fi
            ;;
    esac
else
    not_supported
fi

# Stow stow_dirs
log_info "Stowing dirs"
pushd $DOTFILES 1>/dev/null
for stow_dir in ${stow_dirs[@]}; do
    stow -R $stow_dir 2>/dev/null # throws a warning for some reason, works anyway
done
popd 1>/dev/null

# Use Zsh as default shell
log_info "Setting Zsh as default shell"
sudo chsh -s $(which zsh) $USER

# Bundle Zsh plugins
log_info "Bundling antibody plugins"
antibody bundle <$ZDOTDIR/00-plugins.txt >$ZDOTDIR/.plugins

# Install Neovim plugins
# log_info "Installing Neovim plugins"
# nvim --headless +PlugInstall +quitall

# Starts/Restarts Zsh
log_info "Starting Zsh"
exec zsh
