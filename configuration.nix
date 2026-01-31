# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # NVIDIA Wayland requirement
  boot.kernelParams = [ "nvidia-drm.modeset=1" ];

  networking.hostName = "nixos";

  # Enable networking
  networking.networkmanager.enable = true;

  # Time zone
  time.timeZone = "Asia/Kolkata";

  # Ly login manager
  services.xserver.enable = true;
  services.displayManager.ly.enable = true;
  services.displayManager.ly.settings.session_log = false;

  # Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # NVIDIA proprietary driver
  services.xserver.videoDrivers = [ "nvidia" ];

  # Graphics (new unstable syntax)
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false; # RTX 4050
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    LIBVA_DRIVER_NAME = "nvidia";
    XDG_SESSION_TYPE = "wayland";
  };

  # Zsh
  programs.zsh.enable = true;

  # Locale
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

  # X11 keymap
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # User
  users.users.yashy = {
    isNormalUser = true;
    description = "yashY";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [];
  };

  # Allow unfree
  nixpkgs.config.allowUnfree = true;

  # Fonts
  fonts.fontconfig.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    bibata-cursors
  ];

  # Power / system widgets
  services.upower.enable = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.power-profiles-daemon.enable = false;
  services.tlp.enable = true;

  # Docker
  virtualisation.docker.enable = true;

  # Polkit / dbus
  security.polkit.enable = true;
  services.dbus.enable = true;

  # System packages
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
    git
    go
    gradle
    hypridle
    hyprlock
    jetbrains.idea-oss
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

  # Nix features
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # OpenSSH
  services.openssh.enable = true;

  # State version
  system.stateVersion = "25.11";
}
