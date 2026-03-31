{...}: {
  networking = {
    firewall = {
      enable = false;
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
    fwupd.enable = true;
    gvfs.enable = true;
    openssh.enable = true;
    printing.enable = true;
    resolved.enable = true;
    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;
        DISK_DEVICES = "nvme0n1";
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
  programs = {
    gnupg.agent.enable = true;
    virt-manager.enable = true;
  };
  virtualisation = {
    docker = {
      enable = true;
      autoPrune.enable = true;
    };
    libvirtd.enable = true;
  };
}
