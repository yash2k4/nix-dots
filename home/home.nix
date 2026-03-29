{...}: {
  imports = [
    ./dotfiles.nix
    ./dents/git.nix
    ./dents/nix-search.nix
    ./dents/nvf.nix
    ./dents/noctalia.nix
    ./dents/sh.nix
    ./dents/spicetify.nix
    ./dents/vesktop.nix
  ];
  home = {
    username = "yash2k4";
    homeDirectory = "/home/yash2k4";
    stateVersion = "26.05";
  };
}
