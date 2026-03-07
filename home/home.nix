{ config, pkgs, inputs, lib, ... }:
{
  imports = [
    ./config-files.nix
    ./programs/bash.nix
    ./programs/git.nix
    ./programs/nix-search.nix
    ./programs/spicetify.nix
    ./programs/zsh.nix
  ];
  home = {
    username = "yash2k4";
    homeDirectory = "/home/yash2k4";
    stateVersion = "25.11";
  };
}
