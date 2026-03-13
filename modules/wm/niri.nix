{ pkgs, ... }:
{
  imports = [ ../packages.nix ];

  programs.niri.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
    ];
  };

  environment.systemPackages = with pkgs; [
    flameshot
    foot
    fuzzel
    nwg-look
    swayidle
    wl-clipboard
    xwayland-satellite
  ];
}
