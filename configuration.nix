{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 7;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ "nvidia-drm.modeset=1" ];

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Kolkata";

  services.xserver.enable = true;
  services.displayManager.ly.enable = true;
  services.displayManager.ly.settings.session_log = false;

  programs.hyprland.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics.enable = true;

  programs.zsh.enable = true;

  users.users.yashy = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    neovim
    docker
    fd
    hypridle
    hyprlock
    hyprshot
    waybar
    wl-clipboard
    brightnessctl
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "25.11";
}
