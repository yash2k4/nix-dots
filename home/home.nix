{ ... }:

{
  imports = [
    ./modules/files.nix
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
