{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nvidia.nix
    ../../modules/services.nix
    ../../modules/stylix.nix
    ../../modules/users.nix
    ../../modules/zram.nix
    ../../modules/wm/niri.nix
  ];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot.enable = true;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

  hardware.bluetooth.enable = true;

  i18n.defaultLocale = "en_US.UTF-8";

  networking = {
    hostName = "nixro";
    networkmanager.enable = true;
  };

  nix.settings.experimental-features = [
    "flakes"
    "nix-command"
  ];

  nixpkgs.config.allowUnfree = true;

  programs = {
    firefox.enable = true;
    zsh.enable = true;
  };

  system.stateVersion = "25.11";

  time.timeZone = "Asia/Kolkata";
}
