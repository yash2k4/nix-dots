{ pkgs, ... }:
{
  imports = [
    ./disko.nix
    ./hardware-configuration.nix
    ./packages.nix
    ../../modules/core
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  modules = {
    audio.enable = true;
    battery.enable = true;
    flatpak.enable = true;
    lanzaboote.enable = true;
    networking.enable = true;
    nix.enable = true;
    nvidia-intel.enable = true;
    services.enable = true;
    sops.enable = true;
    stylix.enable = true;
    virtualization.enable = true;
    zram.enable = true;
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  networking = {
    hostName = "satella";
    networkmanager.enable = true;
  };

  time.timeZone = "Asia/Kolkata";

  i18n.defaultLocale = "en_US.UTF-8";

  programs = {
    xwayland.enable = true;
    zsh.enable = true;
    sway = {
      enable = true;
      package = pkgs.sway;
      extraOptions = [
        "--unsupported-gpu"
      ];
    };
  };

  security.pam.services.swaylock = { };

  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "matrix";
      bigclock = "en";
      numlock = true;
    };
  };

  users.users.yvnth = {
    isNormalUser = true;
    description = "yvnth";
    shell = pkgs.zsh;
    initialPassword = "changeme";
    extraGroups = [
      "wheel"
      "networkmanager"
      "audio"
      "video"
      "docker"
      "libvirtd"
    ];
  };

  xdg.portal = {
    enable = true;
    config = {
      sway = {
        "org.freedesktop.impl.portal.ScreenCast" = [
          "wlr"
        ];
      };
    };
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
  };

  system.stateVersion = "25.11";
}
