<div align="center">

# ❄️ nix-dots ❄️

![NixOS](https://img.shields.io/badge/NixOS-unstable-5277C3?style=for-the-badge&logo=nixos&logoColor=white)
![Flakes](https://img.shields.io/badge/Flakes-enabled-5277C3?style=for-the-badge&logo=nixos&logoColor=white)
![Home Manager](https://img.shields.io/badge/Home_Manager-enabled-5277C3?style=for-the-badge&logo=nixos&logoColor=white)

</div>

## Auto Install

> [!WARNING]
> Work in Progress. Repository must be publicly accessible for unauthenticated
> flake evaluation.

```bash
nix-shell -p git --command \
  "nix run github:yash2k4/nix-dots \
    --extra-experimental-features nix-command \
    --extra-experimental-features flakes"
```

## Manual Install

### 1. Bootstrap

Extend the system closure with the requisite tooling and activate:

```nix
# /etc/nixos/configuration.nix
environment.systemPackages = with pkgs; [ git gh ];
```

```bash
sudo nixos-rebuild switch
```

### 2. Authenticate

```bash
gh auth login
# GitHub.com → SSH → authenticate via browser
# Verify device code at github.com/login/device from another machine
```

### 3. Clone & Inject Hardware Config

Materialise the repository, expunge the stub, and bind the machine-generated
hardware profile:

```bash
gh repo clone yash2k4/nix-dots ~/nix-dots
rm ~/nix-dots/hosts/nixro/hardware-configuration.nix
cp /etc/nixos/hardware-configuration.nix ~/nix-dots/hosts/nixro/hardware-configuration.nix
```

### 4. Build & Switch

Evaluate the flake, realise all closures into the Nix store, and atomically
rotate the system profile:

```bash
sudo nixos-rebuild switch --flake ~/nix-dots#nixro
reboot
```

<div align="center">

<sub>Built on <a href="https://nixos.org">NixOS</a> · Managed with
<a href="https://github.com/nix-community/home-manager">Home Manager</a> ·
Pinned with <a href="https://nixos.wiki/wiki/Flakes">Flakes</a></sub>

</div>
