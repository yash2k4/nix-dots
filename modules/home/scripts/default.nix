{ config, ... }:

let
  mkOutOfStoreSymlink = config.lib.file.mkOutOfStoreSymlink;
in
{
  home.file.".config/scripts".source =
    mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/home/scripts/config";
}
