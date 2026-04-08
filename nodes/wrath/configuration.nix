{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ../../modules/nvidia.nix
    ../../modules/services.nix
    ../../modules/stylix.nix
  ];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
  };

  hardware.bluetooth.enable = true;

  i18n.defaultLocale = "en_US.UTF-8";

  networking = {
    hostName = "wrath";
    networkmanager.enable = true;
  };

  nix.settings.experimental-features = [
    "flakes"
    "nix-command"
  ];

  nixpkgs.config.allowUnfree = true;

  programs = {
    niri.enable = true;
    zsh.enable = true;
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time";
        user = "greeter";
      };
    };
  };

  time.timeZone = "Asia/Kolkata";

  users.users.yash2k4 = {
    description = "yash2k4";
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "audio"
      "docker"
      "libvirtd"
      "networkmanager"
      "video"
      "wheel"
    ];
  };

  xdg.portal.enable = true;

  zramSwap = {
    enable = true;
    priority = 100;
    algorithm = "lz4";
    memoryPercent = 50;
  };

  system.stateVersion = "25.11";
}
