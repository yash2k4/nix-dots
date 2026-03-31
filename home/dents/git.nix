{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "yash2k4";
        email = "yash2k4@users.noreply.git.com";
      };

      init.defaultBranch = "main";
      core.editor = "nvim";
      core.autocrlf = "input";

      pull.rebase = true;
      rebase.autoStash = true;
      fetch.prune = true;
      push.autoSetupRemote = true;
      rerere.enabled = true;

      color.ui = "auto";
      diff.colorMoved = "default";
      merge.conflictstyle = "zdiff3";
    };
  };
}
