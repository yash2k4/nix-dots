#!/usr/bin/env bash
set -e

echo "Choose AUR helper:"
echo "1) paru"
echo "2) yay"
read -rp "Enter choice (1/2): " choice

sudo pacman -Syu --noconfirm

sudo pacman -S --needed --noconfirm \
    base-devel \
    git \
    pacman-contrib \
    rustup

rustup default stable

if ! grep -q "^\[multilib\]" /etc/pacman.conf; then
    sudo sed -i '/\[multilib\]/,/Include/s/^#//' /etc/pacman.conf
fi

sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB

sudo pacman -U --noconfirm \
    https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst \
    https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst

if ! grep -q "^\[chaotic-aur\]" /etc/pacman.conf; then
    echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf >/dev/null
fi

sudo pacman -Syu --noconfirm

if [ "$choice" = "1" ]; then
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si --noconfirm
    cd ..
    rm -rf paru
    AUR_HELPER="paru"
elif [ "$choice" = "2" ]; then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
    AUR_HELPER="yay"
else
    echo "Invalid choice"
    exit 1
fi

$AUR_HELPER -S --needed --noconfirm \
    ani-cli \
    asciiquarium \
    astroterm \
    bat \
    btop \
    cava \
    cbonsai \
    cointop-bin \
    cowsay \
    docker-credential-pass-bin \
    dysk \
    figlet \
    fortune-mod \
    go \
    gradle \
    intellij-idea-community-edition \
    jdk21-openjdk \
    kotlin \
    lazydocker \
    lazygit \
    libqalculate \
    localsend-bin \
    man-db \
    man-pages \
    maven \
    nerdfetch \
    nodejs \
    noto-fonts-cjk \
    noto-fonts-emoji \
    npm \
    obsidian \
    pastel \
    pfetch-rs \
    pipes.sh \
    postman-bin \
    python-pip \
    ruby \
    sl \
    smassh-bin \
    speedtest-cli \
    spicetify-cli \
    spotify \
    tealdeer \
    timeshift-autosnap \
    trash-cli \
    tree \
    tty-clock \
    unimatrix-git \
    unzip \
    uwufetch \
    vesktop-bin \
    visual-studio-code-bin \
    wl-clipboard \
    wlsunset \
    yazi \
    zig \
    zip
