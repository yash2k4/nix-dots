{ pkgs, ... }:
{
  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        80
        443
        53317
      ];
      allowedUDPPorts = [
        53317
        5353
      ];
    };
  };

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

    power-profiles-daemon.enable = false;

    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;
        DISK_DEVICES = "nvme0n1 sda";
        DISK_APM_LEVEL_ON_AC = "254 254";
        DISK_APM_LEVEL_ON_BAT = "128 128";
        RUNTIME_PM_ON_AC = "auto";
        RUNTIME_PM_ON_BAT = "auto";
        PCIE_ASPM_ON_AC = "default";
        PCIE_ASPM_ON_BAT = "powersupersave";
        USB_AUTOSUSPEND = 1;
        WIFI_PWR_ON_AC = "off";
        WIFI_PWR_ON_BAT = "on";
      };
    };

    thermald.enable = true;

    upower.enable = true;
  };

  virtualisation = {
    docker.enable = true;

    libvirtd.enable = true;
  };

  programs.virt-manager.enable = true;
}
