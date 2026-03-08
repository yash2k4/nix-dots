{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    acpi
    ani-cli
    asciiquarium
    astroterm
    autotiling
    bat
    bluetui
    brightnessctl
    btop
    cava
    cargo-seek
    cbonsai
    cointop
    cowsay
    docker-compose
    dunst
    dysk
    eza
    fastfetch
    figlet
    foot
    fortune
    fuzzel
    fzf
    gh
    glab
    go
    gradle
    grim
    impala
    jdk21
    jetbrains.idea
    kotlin
    lazydocker
    lazygit
    libnotify
    libqalculate
    localsend
    lsd
    man-db
    man-pages
    maven
    microfetch
    nemo
    nerdfetch
    neovim
    nitch
    nodejs
    nwg-look
    obsidian
    papirus-icon-theme
    pastel
    pavucontrol
    pfetch-rs
    pipes
    postman
    ruby
    rustup
    sl
    slurp
    speedtest-cli
    spicetify-cli
    starship
    swaybg
    swayidle
    swaylock-effects
    tealdeer
    trash-cli
    tree
    tty-clock
    tuigreet
    unimatrix
    unzip
    uwufetch
    vesktop
    vscode
    waybar
    wget
    wl-clipboard
    xdg-desktop-portal
    yazi
    zathura
    zoxide
    zig
    zip

    (pkgs.makeDesktopItem {
      name = "sway-nvidia";
      desktopName = "Sway (NVIDIA)";
      exec = "${pkgs.swayfx}/bin/sway --unsupported-gpu";
      type = "Application";
    })
  ];
}
