{ ... }:

{
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
}
