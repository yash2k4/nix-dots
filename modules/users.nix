{ pkgs, ... }:

{
  users.users.yash2k4 = {
    description = "yash2k4";

    isNormalUser = true;

    shell = pkgs.zsh;

    extraGroups = [
      "docker"
      "libvirtd"
      "networkmanager"
      "wheel"
    ];
  };
}
