{...}: {
  imports = [
    ./dotfiles.nix
    ./programs/git.nix
    ./programs/nix-search.nix
    ./programs/nvf.nix
    ./programs/noctalia.nix
    ./programs/sh.nix
    ./programs/spicetify.nix
    ./programs/vesktop.nix
  ];
  home = {
    username = "yash2k4";
    homeDirectory = "/home/yash2k4";
    stateVersion = "26.05";
  };
}
