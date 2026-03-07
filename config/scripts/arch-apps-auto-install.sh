#!/usr/bin/env bash
set -e

echo "Choose your Window Manager / Desktop Environment:"
echo "1) Hyprland"
echo "2) i3"
echo "3) KDE"
echo "4) Niri"
echo "5) Sway"
read -rp "Enter choice (1-5 or name): " wm_input
wm_input="${wm_input,,}"

case "$wm_input" in
    1|hyprland) WM="hyprland" ;;
    2|i3)       WM="i3"       ;;
    3|kde)      WM="kde"      ;;
    4|niri)     WM="niri"     ;;
    5|sway)     WM="sway"     ;;
    *) echo "Invalid choice"; exit 1 ;;
esac

echo ""
echo "Choose AUR helper:"
echo "1) paru"
echo "2) yay"
read -rp "Enter choice (1/2 or name): " aur_input
aur_input="${aur_input,,}"

case "$aur_input" in
    1|paru) AUR_CHOICE="paru" ;;
    2|yay)  AUR_CHOICE="yay"  ;;
    *) echo "Invalid choice"; exit 1 ;;
esac

sudo pacman -Syu --noconfirm

BASE_PKGS=(
    base-devel
    git
    pacman-contrib
    rustup
)

if [ "$WM" = "i3" ]; then
    BASE_PKGS+=(
        xorg-server
        xorg-xev
        xorg-xinit
        xorg-xinput
        xorg-xrandr
        xorg-xrdb
        xorg-xset
    )
fi

sudo pacman -S --needed --noconfirm "${BASE_PKGS[@]}"

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

if [ "$AUR_CHOICE" = "paru" ]; then
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si --noconfirm
    cd ..
    rm -rf paru
    AUR_HELPER="paru"
else
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
    AUR_HELPER="yay"
fi

PKGS=(
    ani-cli
    asciiquarium
    astroterm
    bat
    btop
    cava
    cbonsai
    cointop-bin
    cowsay
    docker-compose
    docker-scout
    dysk
    figlet
    fortune-mod
    go
    gradle
    intellij-idea-community-edition
    jdk21-openjdk
    kate
    kotlin
    lazydocker
    lazygit
    libqalculate
    localsend-bin
    eza
    man-db
    man-pages
    maven
    nerdfetch
    noctalia-shell
    nodejs
    noto-fonts-cjk
    noto-fonts-emoji
    npm
    obsidian
    papirus-folders-catppuccin-git
    papirus-icon-theme
    pastel
    pfetch-rs
    pipes.sh
    polkit-gnome
    postman-bin
    python-pip
    ruby
    sl
    smassh-bin
    speedtest-cli
    spicetify-cli
    spotify
    tealdeer
    timeshift-autosnap
    trash-cli
    tree
    tty-clock
    unimatrix-git
    unzip
    upower
    uwufetch
    vesktop-bin
    visual-studio-code-bin
    wl-clipboard
    yazi
    zig
    zip
)

case "$WM" in
    hyprland)
        PKGS+=(
            bibata-cursor-theme-bin
            brightnessctl
            catppuccin-gtk-theme-mocha
            hypridle
            hyprlock
            wlsunset
        )
        ;;
    i3)
        PKGS+=(
            acpi
            autotiling
            bluetui
            brightnessctl
            catppuccin-gtk-theme-mocha
            cronie
            dunst
            grub-btrfs
            impala
            inotify-tools
            maim
            nsxiv
            numlockx
            zathura
            zathura-pdf-poppler
        )
        ;;
    kde)
        PKGS+=(
            docker-credential-pass-bin
            man-pages
            wlsunset
        )
        PKGS=("${PKGS[@]/noctalia-shell}")
        PKGS=("${PKGS[@]/papirus-folders-catppuccin-git}")
        PKGS=("${PKGS[@]/papirus-icon-theme}")
        PKGS=("${PKGS[@]/polkit-gnome}")
        PKGS=("${PKGS[@]/upower}")
        ;;
    niri)
        PKGS+=(
            bibata-cursor-theme-bin
            brightnessctl
            catppuccin-gtk-theme-mocha
            flameshot
            grim
            slurp
            wlsunset
            zathura
            zathura-pdf-poppler
        )
        ;;
    sway)
        PKGS+=(
            acpi
            autotiling
            bibata-cursor-theme-bin
            bluetui
            brightnessctl
            catppuccin-gtk-theme-mocha
            cronie
            dunst
            hyperfine
            impala
            nsxiv
            swaybg
            swayidle
            swaylock
            wev
            xdg-desktop-portal
            xdg-desktop-portal-wlr
            zathura
            zathura-pdf-poppler
        )
        ;;
esac

PKGS=($(printf '%s\n' "${PKGS[@]}" | sort -u | grep -v '^$'))

$AUR_HELPER -S --needed --noconfirm "${PKGS[@]}"
