{
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "thunderbolt"
    "nvme"
    "usbhid"
    "usb_storage"
    "sd_mod"
  ];

  boot.initrd.kernelModules = [];

  boot.kernelModules = [
    "kvm-intel"
  ];

  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/3be38373-3879-4666-af5e-f48098fc626c";
    fsType = "btrfs";

    options = [
      "subvol=@"
    ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/3be38373-3879-4666-af5e-f48098fc626c";
    fsType = "btrfs";

    options = [
      "subvol=@home"
    ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/4E45-555C";
    fsType = "vfat";

    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  swapDevices = [];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  hardware.cpu.intel.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;
}
