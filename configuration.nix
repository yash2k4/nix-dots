{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking = {
    hostName = "nixro";
    networkmanager.enable = true;

    firewall = {
      enable = true;

      allowedTCPPorts = [
        22
        80
        443
        53317
      ];

      allowedUDPPorts = [
        53317
        5353
      ];
    };
  };

  time.timeZone = "Asia/Kolkata";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
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
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  programs = {
    zsh.enable = true;
    firefox.enable = true;
    niri.enable = true;
  };

  users.users.yash2k4 = {
    isNormalUser = true;
    description = "yash2k4";
    extraGroups = [ "docker" "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };

  nixpkgs.config.allowUnfree = true;

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    bluetooth.enable = true;

    nvidia = {
      modesetting.enable = true;
      open = true;
      nvidiaSettings = true;
      nvidiaPersistenced = true;

      powerManagement = {
        enable = true;
        finegrained = true;
      };

      package = config.boot.kernelPackages.nvidiaPackages.stable;

      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };

        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };

  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "catppuccin-mocha-mauve";
    };

    openssh.enable = true;
    power-profiles-daemon.enable = true;
    thermald.enable = true;
    upower.enable = true;
  };

  powerManagement.powertop.enable = true;

  virtualisation.docker.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
    ];
  };

  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      LIBVA_DRIVER_NAME = "nvidia";
    };

    systemPackages = with pkgs; [

      ani-cli
      asciiquarium
      astroterm
      bat
      brightnessctl
      btop
      catppuccin-gtk
      cava
      cbonsai
      cointop
      cowsay
      docker-compose
      dysk
      eza
      fastfetch
      figlet
      fortune
      fuzzel
      fzf
      gh
      ghostty
      glab
      go
      gradle
      grim
      jdk21_headless
      jetbrains.idea
      kotlin
      lazydocker
      lazygit
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
      polkit_gnome
      postman
      ruby
      sl
      slurp
      speedtest-cli
      spicetify-cli
      spotify
      starship
      tealdeer
      trash-cli
      tree
      tty-clock
      unimatrix
      unzip
      uwufetch
      vesktop
      vscode
      wget
      wl-clipboard
      wlsunset
      xdg-desktop-portal
      xwayland-satellite
      yazi
      zathura
      zoxide
      zig
      zip

      (catppuccin-sddm.override {
        flavor = "mocha";
        accent = "mauve";
        font = "JetBrainsMono Nerd Font";
        fontSize = "9";
        loginBackground = true;
      })
    ];
  };

  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

  system.stateVersion = "25.11";
}
