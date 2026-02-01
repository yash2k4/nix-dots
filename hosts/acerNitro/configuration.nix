{ config, pkgs, ... }:

{
  imports = [
    ../../configuration.nix
  ];

  networking.hostName = "NixOS-acerNitro";

  hardware.nvidia.open = false;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
}
