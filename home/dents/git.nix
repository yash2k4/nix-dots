{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "yash2k4";
        email = "yash2k4@users.noreply.git.com";
      };

      init.defaultBranch = "main";
      core.editor = "nvim";
      pull.rebase = true;
      rebase.autoStash = true;
      color.ui = "auto";
      core.autocrlf = "input";
      fetch.prune = true;
      push.autoSetupRemote = true;
      rerere.enabled = true;
      diff.colorMoved = "default";
      merge.conflictstyle = "zdiff3";
    };
  };
}
