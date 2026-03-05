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
    hostName = "nixos";
    networkmanager.enable = true;
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
    extraGroups = [ "networkmanager" "wheel" ];
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
    upower.enable = true;
    power-profiles-daemon.enable = true;
  };

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
      neovim
      wget
      nitch
      fastfetch
      ghostty
      fuzzel
      nemo
      jetbrains.idea
      vscode
      localsend
      postman
      jdk21_headless
      spotify
      yazi
      zathura
      btop
      wl-clipboard
      vesktop
      eza
      nwg-look
      xwayland-satellite
      zoxide
      fzf
      starship
      ani-cli
      asciiquarium
      astroterm
      bat
      brightnessctl
      catppuccin-gtk
      cava
      cbonsai
      cointop
      cowsay
      docker-compose
      dysk
      figlet
      flameshot
      fortune
      go
      gradle
      grim
      kotlin
      lazydocker
      lazygit
      libqalculate
      lsd
      man-db
      maven
      nerdfetch
      nodejs
      obsidian
      papirus-icon-theme
      pastel
      pfetch-rs
      pipes
      polkit_gnome
      ruby
      sl
      slurp
      speedtest-cli
      spicetify-cli
      tealdeer
      trash-cli
      tree
      tty-clock
      unimatrix
      unzip
      uwufetch
      wlsunset
      zig
      zip
      gh
      glab
      xdg-desktop-portal

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
