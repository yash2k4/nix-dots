{ ... }:

{
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
      rbldan = "sudo nixos-rebuild switch --flake ~/nix-dots#acerNitro";
      sai = "system-age-info";
      sybau = "shutdown now";
      tock = "tty-clock -C 5 -b -s -c";
      vim = "nvim";
    };

    initContent = ''
      bindkey '^[[1;5D' backward-word
      bindkey '^[[1;5C' forward-word

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
}
