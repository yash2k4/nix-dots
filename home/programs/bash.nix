{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;

    shellAliases = {
      nixro = "sudo nixos-rebuild switch --flake ~/nix-dots#nixro --accept-flake-config";
      nixrt = "sudo nixos-rebuild test --flake ~/nix-dots#nixro --accept-flake-config";
      nixrb = "sudo nixos-rebuild build --flake ~/nix-dots#nixro --accept-flake-config";
      nixup = "cd ~/nix-dots && nix flake update && sudo nixos-rebuild switch --flake .#nixro --accept-flake-config";
      nixgc = "sudo nix-collect-garbage -d";

      vim = "nvim";
      ls = "eza --icons --group-directories-first";
      ll = "eza -la --icons --group-directories-first --git";
      tree = "eza --tree --icons";
    };

    initExtra = ''
PS1='[\[\e[38;2;245;194;231m\]\u\[\e[38;2;166;173;200m\]@\[\e[38;2;137;180;250m\]\H\[\e[0m\] \[\e[38;2;249;226;175m\]\W\[\e[0m\]]\[\e[38;2;166;227;161m\]\\$\[\e[0m\] '
'';
  };
}
