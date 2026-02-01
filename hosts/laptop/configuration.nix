{ config, pkgs, ... }:

{
  imports = [
    ../../configuration.nix
  ];

  networking.hostName = "NixOS-acerNitro";
}
