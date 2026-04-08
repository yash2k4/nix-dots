{...}: {
  networking = {
    firewall = {
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
      enable = true;
    };
  };

  programs = {
    gnupg.agent.enable = true;
    virt-manager.enable = true;
  };

  security.polkit.enable = true;

  services = {
    acpid.enable = true;
    avahi.enable = true;
    blueman.enable = true;

    btrfs.autoScrub = {
      enable = true;
      interval = "monthly";
    };

    earlyoom.enable = true;

    flatpak = {
      enable = true;

      remotes = [
        {
          location = "https://flathub.org/repo/flathub.flatpakrepo";
          name = "flathub";
        }
      ];

      update.auto = {
        enable = true;
        onCalendar = "*-*-01 00:00:00";
      };
    };

    fwupd.enable = true;
    gvfs.enable = true;
    openssh.enable = true;
    printing.enable = true;
    resolved.enable = true;

    thermald.enable = true;

    tlp = {
      enable = true;
      settings = {
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        DISK_DEVICES = "nvme0n1";
        PCIE_ASPM_ON_AC = "default";
        PCIE_ASPM_ON_BAT = "powersupersave";
        RUNTIME_PM_ON_AC = "auto";
        RUNTIME_PM_ON_BAT = "auto";
        USB_AUTOSUSPEND = 1;
        WIFI_PWR_ON_AC = "off";
        WIFI_PWR_ON_BAT = "on";
      };
    };

    upower.enable = true;
  };

  virtualisation = {
    docker = {
      autoPrune.enable = true;
      enable = true;
    };
    libvirtd.enable = true;
  };
}
