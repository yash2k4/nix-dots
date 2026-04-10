{
  description = "yash2k4's NixOS config";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak = {
      url = "github:gmodena/nix-flatpak/?ref=latest";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.noctalia-qs.follows = "noctalia-qs";
    };

    noctalia-qs = {
      url = "github:noctalia-dev/noctalia-qs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
  };

  outputs = {
    home-manager,
    nix-flatpak,
    nixpkgs,
    noctalia,
    noctalia-qs,
    nvf,
    self,
    spicetify-nix,
    stylix,
    ...
  } @ inputs: {
    nixosConfigurations.satella = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = {
        inherit inputs;
      };

      modules = [
        ./hosts/satella/configuration.nix

        nix-flatpak.nixosModules.nix-flatpak

        home-manager.nixosModules.home-manager

        stylix.nixosModules.stylix

        {
          home-manager = {
            backupFileExtension = "bak";
            extraSpecialArgs = {
              inherit inputs;
            };
            useGlobalPkgs = true;
            useUserPackages = true;

            users.yash2k4 = {
              imports = [
                ./hosts/satella/home.nix
                inputs.noctalia.homeModules.default
                nvf.homeManagerModules.default
                spicetify-nix.homeManagerModules.default
              ];
            };
          };
        }
      ];
    };
  };
}
