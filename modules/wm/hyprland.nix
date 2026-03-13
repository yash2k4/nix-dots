{ pkgs, ... }:
{
  imports = [ ../packages.nix ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
  };

  environment.systemPackages = with pkgs; [
    flameshot
    foot
    fuzzel
    hypridle
    hyprlock
    nwg-look
    wl-clipboard
  ];
}
