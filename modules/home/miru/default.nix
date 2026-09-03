{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.homeModules.miru.enable = lib.mkEnableOption "miru";

  config = lib.mkIf config.homeModules.miru.enable {
    home.packages = with pkgs; [
      miru
    ];

    home.file.".config/miru".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/home/miru/config";
  };
}
