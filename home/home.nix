{ config, pkgs, inputs, lib, ... }:
{
  imports = [
    ./dotfiles.nix
    ./apps/bash.nix
    ./apps/git.nix
    ./apps/nix-search.nix
    ./apps/noctalia.nix
    ./apps/spicetify.nix
    ./apps/vesktop.nix
    ./apps/zsh.nix
  ];
  home = {
    username = "yash2k4";
    homeDirectory = "/home/yash2k4";
    stateVersion = "25.11";
  };
}
