{pkgs, ...}: {
  imports = [../packages.nix];

  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
  };

  environment.systemPackages = with pkgs; [
    bluetui
    dunst
    lxappearance
    maim
    polybar
    rofi
    xclip
  ];
}
