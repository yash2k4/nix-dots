{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    initrd.kernelModules = [
      "nvidia"
      "nvidia_drm"
      "nvidia_modeset"
      "nvidia_uvm"
    ];

    kernelPackages = pkgs.linuxPackages_latest;

    kernelParams = [
      "nvidia-drm.modeset=1"
    ];

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
  };

  environment = {
    sessionVariables = {
      GBM_BACKEND = "nvidia-drm";
      LIBVA_DRIVER_NAME = "nvidia";
      NIXOS_OZONE_WL = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    };

    systemPackages = with pkgs; [
      ani-cli
      asciiquarium
      astroterm
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
  };

  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

  hardware = {
    bluetooth.enable = true;

    graphics = {
      enable = true;
      enable32Bit = true;
    };

    nvidia = {
      modesetting.enable = true;
      nvidiaPersistenced = true;
      nvidiaSettings = true;
      open = true;

      package = config.boot.kernelPackages.nvidiaPackages.stable;

      powerManagement = {
        enable = true;
        finegrained = true;
      };

      prime = {
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";

        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
      };
    };
  };

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

  networking = {
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

    hostName = "nixro";
    networkmanager.enable = true;
    wireless.iwd.enable = true;
    networkmanager.wifi.backend = "iwd";
  };

  nix.settings.experimental-features = [
    "flakes"
    "nix-command"
  ];

  nixpkgs.config.allowUnfree = true;

  powerManagement.powertop.enable = true;

  programs = {
    firefox.enable = true;

    sway = {
      enable = true;
      package = pkgs.swayfx;
      wrapperFeatures.gtk = true;
    };

    zsh.enable = true;
  };

  services = {
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time";
          user = "greeter";
        };
      };
    };

    openssh.enable = true;
    power-profiles-daemon.enable = true;
    thermald.enable = true;
    upower.enable = true;
  };

  services.xserver = {
    videoDrivers = [ "nvidia" ];

    xkb = {
      layout = "us";
      variant = "";
    };
  };

  system.stateVersion = "25.11";

  time.timeZone = "Asia/Kolkata";

  users.users.yash2k4 = {
    description = "yash2k4";
    extraGroups = [
      "docker"
      "networkmanager"
      "wheel"
    ];
    isNormalUser = true;
    shell = pkgs.zsh;
  };

  virtualisation.docker.enable = true;

  xdg.portal = {
    enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
    ];
  };
}
