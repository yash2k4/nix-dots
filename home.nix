{ config, pkgs, inputs, ... }:
{
  home = {
    username = "yash2k4";
    homeDirectory = "/home/yash2k4";
    stateVersion = "25.11";
    packages = [
      (pkgs.writeShellApplication {
        name = "ns";
        runtimeInputs = with pkgs; [
          fzf
          nix-search-tv
        ];
        text = builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
      })
    ];
  };

  programs = {
    git = {
      enable = true;
      settings = {
        user = {
          name = "yash2k4";
          email = "yash2k4@users.noreply.github.com";
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

    zsh = {
      enable = true;
      initContent = ''
if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
fi

ZINIT_HOME="''${XDG_DATA_HOME:-''${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
mkdir -p "''${ZINIT_HOME:h}"
git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "''${ZINIT_HOME}/zinit.zsh"

zinit ice depth=1
zinit light romkatv/powerlevel10k

zinit ice wait"0" lucid
zinit light Aloxaf/fzf-tab

zinit ice wait"0" lucid
zinit light zsh-users/zsh-history-substring-search

autoload -Uz compinit
zcompdump="''${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcompdump"
mkdir -p "''${zcompdump:h}"
compinit -C -d "$zcompdump"

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "''${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --icons --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --icons --color=always $realpath'

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

HISTFILE="''${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"
mkdir -p "''${HISTFILE:h}"
HISTSIZE=100000
SAVEHIST=100000

setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt EXTENDED_HISTORY
setopt HIST_SAVE_NO_DUPS

alias nixro='sudo nixos-rebuild switch --flake ~/nix-dots#nixro --accept-flake-config'
alias nixrt='sudo nixos-rebuild test --flake ~/nix-dots#nixro --accept-flake-config'
alias nixrb='sudo nixos-rebuild build --flake ~/nix-dots#nixro --accept-flake-config'
alias nixup='cd ~/nix-dots && nix flake update && sudo nixos-rebuild switch --flake .#nixro --accept-flake-config'
alias nixgc='sudo nix-collect-garbage -d'

alias vim='nvim'
alias ls='eza --icons --group-directories-first'
alias ll='eza -la --icons --group-directories-first --git'
alias tree='eza --tree --icons'

zinit ice wait"0" lucid atload'eval "$(fzf --zsh)"'
zinit light junegunn/fzf

zinit ice wait"0" lucid atload'eval "$(zoxide init --cmd cd zsh)"'
zinit light ajeetdsouza/zoxide

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

zinit ice wait"0" lucid
zinit light zsh-users/zsh-syntax-highlighting
'';
    };
  };

  home.file.".config/alacritty".source = ./config/alacritty;
  home.file.".config/btop".source = ./config/btop;
  home.file.".config/cava".source = ./config/cava;
  home.file.".config/doom".source = ./config/doom;
  home.file.".config/dunst".source = ./config/dunst;
  home.file.".config/dwm".source = ./config/dwm;
  home.file.".config/fastfetch".source = ./config/fastfetch;
  home.file.".config/flameshot".source = ./config/flameshot;
  home.file.".config/foot".source = ./config/foot;
  home.file.".config/fuzzel".source = ./config/fuzzel;
  home.file.".config/hypr".source = ./config/hypr;
  home.file.".config/i3".source = ./config/i3;
  home.file.".config/kitty".source = ./config/kitty;
  home.file.".config/lazydocker".source = ./config/lazydocker;
  home.file.".config/lazygit".source = ./config/lazygit;
  home.file.".config/nvim".source = ./config/nvim;
  home.file.".config/picom".source = ./config/picom;
  home.file.".config/polybar".source = ./config/polybar;
  home.file.".config/rofi".source = ./config/rofi;
  home.file.".config/scripts".source = ./config/scripts;
  home.file.".config/slstatus".source = ./config/slstatus;
  home.file.".config/st".source = ./config/st;
  home.file.".config/superfile".source = ./config/superfile;
  home.file.".config/sway".source = ./config/sway;
  home.file.".config/swaylock".source = ./config/swaylock;
  home.file.".config/waybar".source = ./config/waybar;
  home.file.".config/yazi".source = ./config/yazi;
  home.file.".config/zathura".source = ./config/zathura;
}
