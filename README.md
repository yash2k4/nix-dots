# ❄️ NixOS Configuration
Declarative, reproducible system configuration built on **Nix Flakes** and **Home Manager**, managing everything from kernel modules to dotfiles as code. Still a work in progress.

## 🚀 Auto Install

> ⚠️ **Work in Progress** — This script only works if the repository is public.

```bash
nix-shell -p git --command "nix run github:yash2k4/nix-dots --extra-experimental-features nix-command --extra-experimental-features flakes"
```
