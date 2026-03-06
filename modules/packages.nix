{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ani-cli
    asciiquarium
    astroterm
    autotiling
    bat
    bibata-cursors
    bluetui
    brightnessctl
    btop
    catppuccin-gtk
    cava
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
    jdk21_headless
    jetbrains.idea
    kotlin
    lazydocker
    lazygit
    libnotify
    libqalculate
    localsend
    lsd
    man-db
    maven
    nemo
    nerdfetch
    neovim
    nitch
    nodejs
    nwg-look
    obsidian
    papirus-icon-theme
    pastel
    pfetch-rs
    pipes
    postman
    rofi
    ruby
    sl
    slurp
    speedtest-cli
    spicetify-cli
    spotify
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
