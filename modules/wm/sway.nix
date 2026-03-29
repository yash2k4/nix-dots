{pkgs, ...}: {
  imports = [../packages.nix];

  programs.sway = {
    enable = true;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
    ];
  };

  environment.systemPackages = with pkgs; [
    autotiling-rs
    swayidle
    swaylock-effects
  ];
}
