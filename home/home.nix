{ config, pkgs, inputs, lib, ... }:
{
  imports = [
    ./dotfiles.nix
    ./dents/bash.nix
    ./dents/git.nix
    ./dents/nix-search.nix
    ./dents/noctalia.nix
    ./dents/spicetify.nix
    ./dents/vesktop.nix
    ./dents/zsh.nix
  ];
  home = {
    username = "yash2k4";
    homeDirectory = "/home/yash2k4";
    stateVersion = "25.11";
  };
}
