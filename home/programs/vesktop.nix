{ ... }:
{
  stylix.targets.vesktop.enable = false;

  xdg.configFile."vesktop/settings.json" = {
    text = builtins.toJSON {
      discordBranch = "stable";
      minimizeToTray = true;
      arRPC = true;
      audio = {
        audioGainControl = false;
      };
      splashColor = "rgb(220, 220, 223)";
      splashBackground = "rgb(30, 30, 46)";
    };
    force = true;
  };
}
