{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ../../modules/audio.nix
    ../../modules/battery.nix
    ../../modules/flatpak.nix
    ../../modules/networking.nix
    ../../modules/nvidia-intel.nix
    ../../modules/services.nix
    ../../modules/stylix.nix
    ../../modules/virtualization.nix
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  hardware.bluetooth.enable = true;

  networking = {
    hostName = "satella";
    networkmanager.enable = true;
  };

  time.timeZone = "Asia/Kolkata";

  i18n.defaultLocale = "en_US.UTF-8";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
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
        user = "greeter";
        command = "${pkgs.tuigreet}/bin/tuigreet --time";
      };
    };
  };

  users.users.yash2k4 = {
    isNormalUser = true;
    description = "yash2k4";
    shell = pkgs.zsh;

    extraGroups = [
      "wheel"
      "networkmanager"
      "audio"
      "video"
      "docker"
      "libvirtd"
    ];
  };

  xdg.portal.enable = true;

  zramSwap = {
    enable = true;
    algorithm = "lz4";
    memoryPercent = 50;
    priority = 100;
  };

  system.stateVersion = "25.11";
}
