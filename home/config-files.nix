{ config, pkgs, ... }:

let
  dotfiles = ../config;

  link = config.lib.file.mkOutOfStoreSymlink;

  configs = [
    "alacritty"
    "doom"
    "dunst"
    "foot"
    "fuzzel"
    "ghostty"
    "hypr"
    "i3"
    "kitty"
    "niri"
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
