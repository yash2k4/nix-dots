{ config, pkgs, ... }:

let
  aliases = import ./aliases.nix;
in
{
  programs.bash = {
    enable = true;

    shellAliases = aliases;

    initExtra = ''
PS1='[\[\e[38;2;245;194;231m\]\u\[\e[38;2;166;173;200m\]@\[\e[38;2;137;180;250m\]\H\[\e[0m\] \[\e[38;2;249;226;175m\]\W\[\e[0m\]]\[\e[38;2;166;227;161m\]\\$\[\e[0m\] '
'';
  };
}
