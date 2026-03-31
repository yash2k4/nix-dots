{config, ...}: let
  mkOutOfStoreSymlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configDir = "${config.home.homeDirectory}/nix-dots/dotfiles";
in {
  home.file = {
    ".config/btop".source = mkOutOfStoreSymlink "${configDir}/btop";
    ".config/cava".source = mkOutOfStoreSymlink "${configDir}/cava";
    ".config/flameshot".source = mkOutOfStoreSymlink "${configDir}/flameshot";
    ".config/foot".source = mkOutOfStoreSymlink "${configDir}/foot";
    ".config/fuzzel".source = mkOutOfStoreSymlink "${configDir}/fuzzel";
    ".config/lazydocker".source = mkOutOfStoreSymlink "${configDir}/lazydocker";
    ".config/lazygit".source = mkOutOfStoreSymlink "${configDir}/lazygit";
    ".config/niri".source = mkOutOfStoreSymlink "${configDir}/niri";
    ".config/scripts".source = mkOutOfStoreSymlink "${configDir}/scripts";
    ".config/yazi".source = mkOutOfStoreSymlink "${configDir}/yazi";
    ".config/zathura".source = mkOutOfStoreSymlink "${configDir}/zathura";
  };
}
