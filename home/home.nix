{ config, pkgs, inputs, ... }:

{
  imports = [
    ./programs/git.nix
    ./programs/bash.nix
    ./programs/zsh.nix
    ./config-files.nix
  ];

  home = {
    username = "yash2k4";
    homeDirectory = "/home/yash2k4";
    stateVersion = "25.11";

    packages = [
      (pkgs.writeShellApplication {
        name = "ns";
        runtimeInputs = with pkgs; [
          fzf
          nix-search-tv
        ];
        text = builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
      })
    ];
  };
}
