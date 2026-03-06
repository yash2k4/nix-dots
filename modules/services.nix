{ pkgs, ... }:

{
  services = {
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time";
          user = "greeter";
        };
      };
    };

    openssh.enable = true;
    power-profiles-daemon.enable = true;
    thermald.enable = true;
    upower.enable = true;
  };

  virtualisation.docker.enable = true;

  powerManagement.powertop.enable = true;
}
