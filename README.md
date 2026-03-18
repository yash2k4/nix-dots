<div align="center">

# ❄️ nix-dots
*A fully declarative, reproducible system configuration built on Nix Flakes and Home Manager,*
*managing everything from kernel modules to dotfiles as a single source of truth.*

![NixOS](https://img.shields.io/badge/NixOS-unstable-5277C3?style=flat-square&logo=nixos&logoColor=white)
![Flakes](https://img.shields.io/badge/Flakes-enabled-5277C3?style=flat-square&logo=nixos&logoColor=white)
![Home Manager](https://img.shields.io/badge/Home_Manager-enabled-5277C3?style=flat-square&logo=nixos&logoColor=white)
![Status](https://img.shields.io/badge/Status-Forever_WIP_%F0%9F%90%87-orange?style=flat-square)

*This configuration is, by nature, perpetually evolving. NixOS is an endless rabbit hole,*
*and every option in the manual is an invitation to go deeper.*

</div>

## 🚀 Auto Install

> [!WARNING]
> WIP — only works if the repository is public.

```bash
nix-shell -p git --command "nix run github:yash2k4/nix-dots --extra-experimental-features nix-command --extra-experimental-features flakes"
```

## 🛠️ Manual Install

Install NixOS via the Calamares installer with **No Desktop** selected, then reboot into the minimal environment.

Declare `git` and `gh` as system packages in `/etc/nixos/configuration.nix`, then apply the change:

```nix
environment.systemPackages = with pkgs; [ git gh ];
```

```bash
sudo nixos-rebuild switch
```

Authenticate the GitHub CLI over SSH. A device code will be issued, verify it at `github.com/login/device` from another machine:

```bash
gh auth login
```

Clone the repository, then replace the placeholder hardware configuration with the one generated for your machine by the installer:

```bash
gh repo clone yash2k4/nix-dots
cd nix-dots
rm hosts/nixro/hardware-configuration.nix
cp /etc/nixos/hardware-configuration.nix hosts/nixro/
```

Evaluate the flake against the `nixro` host configuration, apply it, and reboot:

```bash
sudo nixos-rebuild switch --flake ~/nix-dots#nixro
reboot
```
