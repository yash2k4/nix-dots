let
  aliases = {
    ls = "eza --icons --group-directories-first";
    satella = "sudo nixos-rebuild switch --flake ~/nix-dots#satella";
    tree = "eza --tree --icons";
    vim = "nvim";
  };
in {
  programs.bash = {
    enable = true;
    shellAliases = aliases;
    initExtra = ''
      eval "$(fzf --bash)"
      eval "$(zoxide init bash)"
      export PS1='\[\e[38;5;76m\]\u\[\e[0m\] in \[\e[38;5;32m\]\w\[\e[0m\] \\$ '
    '';
  };

  programs.zsh = {
    enable = true;
    shellAliases = aliases;
    initContent = ''
      if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi

      ZINIT_HOME="''${XDG_DATA_HOME:-''${HOME}/.local/share}/zinit/zinit.git"
      if [ ! -d "$ZINIT_HOME" ]; then
        mkdir -p "$(dirname $ZINIT_HOME)"
        git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
      fi
      source "''${ZINIT_HOME}/zinit.zsh"

      zinit ice depth=1; zinit light romkatv/powerlevel10k

      zinit ice wait"0" lucid; zinit light zsh-users/zsh-syntax-highlighting
      zinit ice wait"0" lucid; zinit light Aloxaf/fzf-tab

      autoload -Uz compinit
      compinit -C
      zinit cdreplay -q

      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

      bindkey -e
      bindkey '^p' history-search-backward
      bindkey '^n' history-search-forward
      bindkey '^[[1;5D' backward-word
      bindkey '^[[1;5C' forward-word

      HISTFILE="''${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"
      mkdir -p "''${HISTFILE:h}"
      HISTSIZE=100000
      SAVEHIST=100000
      setopt SHARE_HISTORY HIST_IGNORE_SPACE HIST_REDUCE_BLANKS EXTENDED_HISTORY HIST_SAVE_NO_DUPS HIST_IGNORE_ALL_DUPS

      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
      zstyle ':completion:*' menu no
      zstyle ':completion:*' use-cache on
      zstyle ':completion:*' cache-path "''${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --icons --color=always $realpath'
      zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --icons --color=always $realpath'

      typeset -U path
      path=(
        "$HOME/.cargo/bin"
        "$HOME/.config/scripts"
        $path
      )

      export EDITOR=nvim
      export VISUAL="$EDITOR"
      export SUDO_EDITOR="$EDITOR"
      export SYSTEMD_EDITOR="$EDITOR"
      export MANPAGER='nvim +Man!'

      eval "$(fzf --zsh)"
      eval "$(zoxide init --cmd cd zsh)"
    '';
  };
}
