{
  description = "yashy@NixOS-acerNitro";

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
    nixosConfigurations = {
      acerNitro = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ({ ... }: {
            nixpkgs.overlays = [ btop-nvidia-overlay ];
          })

          ./hosts/laptop/configuration.nix
          home-manager.nixosModules.home-manager

          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.yashy = import ./home/home.nix;
            };
          }
        ];
      };
    };
  };
}
