{ config, ... }:
let
  mkOutOfStoreSymlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configDir = "${config.home.homeDirectory}/nix-dots/dotfiles";
in
{
  home.file = {
    ".config/alacritty".source = mkOutOfStoreSymlink "${configDir}/alacritty";
    ".config/btop".source = mkOutOfStoreSymlink "${configDir}/btop";
    ".config/cava".source = mkOutOfStoreSymlink "${configDir}/cava";
    ".config/dunst".source = mkOutOfStoreSymlink "${configDir}/dunst";
    ".config/flameshot".source = mkOutOfStoreSymlink "${configDir}/flameshot";
    ".config/foot".source = mkOutOfStoreSymlink "${configDir}/foot";
    ".config/fuzzel".source = mkOutOfStoreSymlink "${configDir}/fuzzel";
    ".config/ghostty".source = mkOutOfStoreSymlink "${configDir}/ghostty";
    ".config/hypr".source = mkOutOfStoreSymlink "${configDir}/hypr";
    ".config/i3".source = mkOutOfStoreSymlink "${configDir}/i3";
    ".config/kitty".source = mkOutOfStoreSymlink "${configDir}/kitty";
    ".config/lazydocker".source = mkOutOfStoreSymlink "${configDir}/lazydocker";
    ".config/lazygit".source = mkOutOfStoreSymlink "${configDir}/lazygit";
    ".config/niri".source = mkOutOfStoreSymlink "${configDir}/niri";
    ".config/nvim".source = mkOutOfStoreSymlink "${configDir}/nvim";
    ".config/picom".source = mkOutOfStoreSymlink "${configDir}/picom";
    ".config/polybar".source = mkOutOfStoreSymlink "${configDir}/polybar";
    ".config/rofi".source = mkOutOfStoreSymlink "${configDir}/rofi";
    ".config/scripts".source = mkOutOfStoreSymlink "${configDir}/scripts";
    ".config/sway".source = mkOutOfStoreSymlink "${configDir}/sway";
    ".config/swaylock".source = mkOutOfStoreSymlink "${configDir}/swaylock";
    ".config/waybar".source = mkOutOfStoreSymlink "${configDir}/waybar";
    ".config/yazi".source = mkOutOfStoreSymlink "${configDir}/yazi";
    ".config/zathura".source = mkOutOfStoreSymlink "${configDir}/zathura";
  };
}
