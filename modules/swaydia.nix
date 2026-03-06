{ config, pkgs, ... }:

{
  boot = {
    initrd.kernelModules = [
      "nvidia"
      "nvidia_drm"
      "nvidia_modeset"
      "nvidia_uvm"
    ];

    kernelPackages = pkgs.linuxPackages_latest;

    kernelParams = [
      "nvidia-drm.modeset=1"
    ];
  };

  environment.sessionVariables = {
    GBM_BACKEND = "nvidia-drm";
    LIBVA_DRIVER_NAME = "nvidia";
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    nvidia = {
      modesetting.enable = true;
      nvidiaPersistenced = true;
      nvidiaSettings = true;
      open = true;

      package = config.boot.kernelPackages.nvidiaPackages.stable;

      powerManagement = {
        enable = true;
        finegrained = true;
      };

      prime = {
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";

        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
      };
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];
}
