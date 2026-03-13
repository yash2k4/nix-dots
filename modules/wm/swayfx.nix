{ pkgs, ... }:
{
  programs.sway = {
    enable = true;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
    ];
  };

  environment.systemPackages = with pkgs; [
    alacritty
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
    foot
    fortune
    fuzzel
    fzf
    gcc
    gh
    glab
    go
    gradle
    grim
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
    slurp
    speedtest-cli
    swayidle
    swaylock-effects
    tealdeer
    tree
    tty-clock
    tuigreet
    unimatrix
    unzip
    uwufetch
    vscode
    waybar
    wget
    wl-clipboard
    yazi
    zathura
    zoxide
    zig
    zip
  ];
}
