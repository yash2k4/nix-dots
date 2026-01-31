{ config, pkgs, ... }:

{
  home.username = "yashy";
  home.homeDirectory = "/home/yashy";
  home.stateVersion = "25.11";

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  home.sessionPath = [
    "$HOME/.config/scripts"
  ];

  home.packages = with pkgs; [
    neovim
    (pkgs.writeShellApplication {
      name = "ns";
      runtimeInputs = with pkgs; [
        fzf
        nix-search-tv
      ];
      text = builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
    })
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "yash2k4";
        email = "yash2k4@users.noreply.github.com";
      };
      init.defaultBranch = "main";
      core.editor = "nvim";
      pull.rebase = false;
      color.ui = "auto";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = builtins.fromTOML
      (builtins.readFile ./config/starship/starship.toml);
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      cat = "bat";
      cbon = "cbonsai -l -i";
      cmatrix = "unimatrix";
      cp = "cp -R";
      ctop = "cointop";
      df = "dysk";
      ga = "git add";
      gc = "git commit -m";
      gp = "git push";
      gpl = "git pull";
      gpu = "git push -u origin main";
      gr = "git restore";
      gs = "git status";
      hx = "helix";
      ls = "lsd";
      lzd = "lazydocker";
      lzg = "lazygit";
      neofetch = "fastfetch";
      pc = "pastel color";
      rbld = "sudo nixos-rebuild switch --flake ~/nix-dots#nixos";
      rbldu = "nix flake update ~/nix-dots && sudo nixos-rebuild switch --flake ~/nix-dots#nixos";
      sai = "system-age-info";
      sybau = "shutdown now";
      tock = "tty-clock -C 5 -b -s -c";
      vim = "nvim";
    };

    initContent = ''
      # ─── Keybinds ─────────────────────────────────────────────
      bindkey '^[[1;5D' backward-word
      bindkey '^[[1;5C' forward-word

      # ─── History ─────────────────────────────────────────────
      HISTFILE=$HOME/.histfile
      HISTSIZE=100000
      SAVEHIST=100000

      setopt APPEND_HISTORY
      setopt SHARE_HISTORY
      setopt INC_APPEND_HISTORY
      setopt HIST_IGNORE_DUPS
      setopt HIST_IGNORE_SPACE
      setopt HIST_REDUCE_BLANKS
      setopt EXTENDED_HISTORY
    '';
  };

  home.file.".config/starship/starship.toml".source =
    ./config/starship/starship.toml;

  home.file.".config/hypr".source   = ./config/hypr;
  home.file.".config/kitty".source  = ./config/kitty;
  home.file.".config/nvim".source   = ./config/nvim;
  home.file.".config/fuzzel".source = ./config/fuzzel;
}
