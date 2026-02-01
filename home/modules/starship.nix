{ ... }:

{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings =
      builtins.fromTOML
        (builtins.readFile ../../config/starship/starship.toml);
  };

  home.file.".config/starship/starship.toml".source =
    ../../config/starship/starship.toml;
}
