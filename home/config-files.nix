{ config, pkgs, ... }:

let
  dotfiles = ../config;

  link = config.lib.file.mkOutOfStoreSymlink;

  configs = [
    "alacritty"
    "btop"
    "cava"
    "doom"
    "dunst"
    "dwm"
    "fastfetch"
    "flameshot"
    "foot"
    "fuzzel"
    "hypr"
    "i3"
    "kitty"
    "lazydocker"
    "lazygit"
    "nvim"
    "picom"
    "polybar"
    "rofi"
    "scripts"
    "slstatus"
    "st"
    "superfile"
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
