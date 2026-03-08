{ config, pkgs, ... }:

let
  dotfiles = ../config;

  link = config.lib.file.mkOutOfStoreSymlink;

  configs = [
    "alacritty"
    "doom"
    "dunst"
    "fastfetch"
    "foot"
    "fuzzel"
    "hypr"
    "i3"
    "kitty"
    "nvim"
    "picom"
    "polybar"
    "rofi"
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
