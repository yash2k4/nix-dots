{ config, pkgs, ... }:

let
  dotfiles = ../config;

  link = config.lib.file.mkOutOfStoreSymlink;

  configs = [
    "dunst"
    "fastfetch"
    "foot"
    "fuzzel"
    "nvim"
    "scripts"
    "sway"
    "swaylock"
    "waybar"
    "yazi"
    "zathura"
  ];

in
{
  home.file = builtins.listToAttrs (
    map (name: {
      name = ".config/${name}";
      value = {
        source = link "${dotfiles}/${name}";
      };
    }) configs
  );
}
