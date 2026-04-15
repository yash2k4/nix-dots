{ ... }:

{
  services = {
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };

    pulseaudio.enable = false;
  };

  security = {
    rtkit.enable = true;
  };
}
