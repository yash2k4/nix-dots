{ pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
  };

  environment.systemPackages = with pkgs; [
    ani-cli
    asciiquarium
    astroterm
    bat
    brightnessctl
    btop
    cava
    cargo-seek
    cbonsai
    cointop
    cowsay
    docker-compose
    dysk
    eza
    fastfetch
    fd
    figlet
    flameshot
    foot
    fortune
    fuzzel
    fzf
    gcc
    gh
    glab
    go
    gradle
    hypridle
    hyprlock
    jdk21
    jetbrains.idea
    kdePackages.kate
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
    mpv
    nemo
    nerdfetch
    neovim
    nitch
    nodejs
    nsxiv
    nwg-look
    obsidian
    papirus-icon-theme
    pastel
    pavucontrol
    pfetch-rs
    pipes
    postman
    ripgrep
    ruby
    rustup
    sl
    speedtest-cli
    tealdeer
    tree
    tty-clock
    tuigreet
    unimatrix
    unzip
    uwufetch
    vscode
    wget
    wl-clipboard
    yazi
    zathura
    zoxide
    zig
    zip
  ];
}
