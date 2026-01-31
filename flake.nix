{
  description = "Hyprland on Nixos";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";

    # 🔧 Overlay: make btop see libnvidia-ml.so.1 (NVML)
    btop-nvidia-overlay = final: prev: {
      btop = prev.btop.overrideAttrs (old: {
        nativeBuildInputs =
          (old.nativeBuildInputs or []) ++ [ final.makeWrapper ];

        postFixup = (old.postFixup or "") + ''
          wrapProgram $out/bin/btop \
            --prefix LD_LIBRARY_PATH : /run/opengl-driver/lib
        '';
      });
    };
  in
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        # 👇 Overlay injected here — nothing else changed
        ({ ... }: {
          nixpkgs.overlays = [ btop-nvidia-overlay ];
        })

        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.yashy = import ./home.nix;
            backupFileExtension = "backup";
          };
        }
      ];
    };
  };
}
