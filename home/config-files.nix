{ config, pkgs, ... }:

{
  home.file.".config/alacritty".source = ../config/alacritty;
  home.file.".config/btop".source = ../config/btop;
  home.file.".config/cava".source = ../config/cava;
  home.file.".config/doom".source = ../config/doom;
  home.file.".config/dunst".source = ../config/dunst;
  home.file.".config/dwm".source = ../config/dwm;
  home.file.".config/fastfetch".source = ../config/fastfetch;
  home.file.".config/flameshot".source = ../config/flameshot;
  home.file.".config/foot".source = ../config/foot;
  home.file.".config/fuzzel".source = ../config/fuzzel;
  home.file.".config/hypr".source = ../config/hypr;
  home.file.".config/i3".source = ../config/i3;
  home.file.".config/kitty".source = ../config/kitty;
  home.file.".config/lazydocker".source = ../config/lazydocker;
  home.file.".config/lazygit".source = ../config/lazygit;
  home.file.".config/nvim".source = ../config/nvim;
  home.file.".config/picom".source = ../config/picom;
  home.file.".config/polybar".source = ../config/polybar;
  home.file.".config/rofi".source = ../config/rofi;
  home.file.".config/scripts".source = ../config/scripts;
  home.file.".config/slstatus".source = ../config/slstatus;
  home.file.".config/st".source = ../config/st;
  home.file.".config/superfile".source = ../config/superfile;
  home.file.".config/sway".source = ../config/sway;
  home.file.".config/swaylock".source = ../config/swaylock;
  home.file.".config/waybar".source = ../config/waybar;
  home.file.".config/yazi".source = ../config/yazi;
  home.file.".config/zathura".source = ../config/zathura;
}
