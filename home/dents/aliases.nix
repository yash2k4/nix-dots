{
  nixro = "sudo nixos-rebuild switch --flake ~/nix-dots#nixro --accept-flake-config";
  nixrt = "sudo nixos-rebuild test --flake ~/nix-dots#nixro --accept-flake-config";
  nixrb = "sudo nixos-rebuild build --flake ~/nix-dots#nixro --accept-flake-config";
  nixup = "cd ~/nix-dots && nix flake update && sudo nixos-rebuild switch --flake .#nixro --accept-flake-config";
  nixgc = "sudo nix-collect-garbage -d";

  vim = "nvim";
  ls = "eza --icons --group-directories-first";
  ll = "eza -la --icons --group-directories-first --git";
  tree = "eza --tree --icons";
}
