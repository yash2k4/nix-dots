{ config, pkgs, ... }:

{
  home.username = "yashy";
  home.homeDirectory = "/home/yashy";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  home.sessionPath = [
    "$HOME/.config/scripts"
  ];

  imports = [
    ./modules/packages.nix
    ./modules/git.nix
    ./modules/zsh.nix
    ./modules/starship.nix
    ./modules/zoxide.nix
    ./modules/files.nix
  ];
}
