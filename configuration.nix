{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  home-manager.users.yashy = import ./home/home.nix;

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 7;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ "nvidia-drm.modeset=1" ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Kolkata";

  services.xserver.enable = true;
  services.displayManager.ly.enable = true;
  services.displayManager.ly.settings.session_log = false;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    LIBVA_DRIVER_NAME = "nvidia";
    XDG_SESSION_TYPE = "wayland";
  };

  programs.zsh.enable = true;

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  users.users.yashy = {
    isNormalUser = true;
    description = "yashY";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [];
  };

  nixpkgs.config.allowUnfree = true;

  fonts.fontconfig.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    bibata-cursors
  ];

  services.upower.enable = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.power-profiles-daemon.enable = false;
  services.tlp.enable = true;

  virtualisation.docker.enable = true;

  security.polkit.enable = true;
  services.dbus.enable = true;

  environment.systemPackages = with pkgs; [
    bat
    bibata-cursors
    btop
    brightnessctl
    cargo-seek
    catppuccin-papirus-folders
    cava
    cbonsai
    cointop
    cowsay
    docker
    dysk
    fastfetch
    figlet
    firefox
    fuzzel
    gh
    go
    gradle
    hypridle
    hyprlock
    hyprshot
    jetbrains.idea-oss
    jdk21
    kitty
    lazydocker
    lazygit
    localsend
    lsd
    ly
    man
    maven
    nemo
    nerd-fonts.jetbrains-mono
    nerdfetch
    nitch
    noctalia-shell
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    nwg-look
    pastel
    rustup
    speedtest-cli
    spotify
    stow
    tealdeer
    tlp
    tree
    tty-clock
    unimatrix
    unzip
    pfetch-rs
    vesktop
    vscode
    waybar
    wget
    wl-clipboard
    wlsunset
    yazi
    zig
    zip
    zoxide
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  services.openssh.enable = true;

  system.stateVersion = "25.11";
}
