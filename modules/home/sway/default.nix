{ lib, config, ... }:
{
  options.homeModules.sway.enable = lib.mkEnableOption "sway";

  config = lib.mkIf config.homeModules.sway.enable {
    home.file.".config/sway".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/home/sway/config";
  };
}
