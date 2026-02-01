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
    ./modules/git.nix
    ./modules/packages.nix
    ./modules/zsh.nix
    ./modules/zoxide.nix
    ./modules/starship.nix

    ./features/hyprland.nix
    ./features/kitty.nix
    ./features/nvim.nix
    ./features/fuzzel.nix
    ./features/fastfetch.nix
    ./features/lazygit.nix
    ./features/lazydocker.nix
    ./features/yazi.nix
  ];
}
