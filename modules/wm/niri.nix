{pkgs, ...}: {
  imports = [../packages.nix];

  programs.niri.enable = true;
  xdg.portal = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    flameshot
    foot
    fuzzel
    grim
    nwg-look
    swayidle
    wl-clipboard
    xwayland-satellite
  ];
}
