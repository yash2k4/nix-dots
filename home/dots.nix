{config, ...}: let
  mkOutOfStoreSymlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configDir = "${config.home.homeDirectory}/nix-dots/dots";
in {
  home.file = {
    ".config/btop".source = mkOutOfStoreSymlink "${configDir}/btop";
    ".config/cava".source = mkOutOfStoreSymlink "${configDir}/cava";
    ".config/flameshot".source = mkOutOfStoreSymlink "${configDir}/flameshot";
    ".config/fuzzel".source = mkOutOfStoreSymlink "${configDir}/fuzzel";
    ".config/lazydocker".source = mkOutOfStoreSymlink "${configDir}/lazydocker";
    ".config/lazygit".source = mkOutOfStoreSymlink "${configDir}/lazygit";
    ".config/niri".source = mkOutOfStoreSymlink "${configDir}/niri";
    ".config/scripts".source = mkOutOfStoreSymlink "${configDir}/scripts";
    ".config/wezterm".source = mkOutOfStoreSymlink "${configDir}/wezterm";
    ".config/yazi".source = mkOutOfStoreSymlink "${configDir}/yazi";
    ".config/zathura".source = mkOutOfStoreSymlink "${configDir}/zathura";
  };
}
