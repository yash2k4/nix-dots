{pkgs, ...}: {
  programs.niri.enable = true;
  xdg.portal = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    swayidle
    xwayland-satellite
  ];
}
