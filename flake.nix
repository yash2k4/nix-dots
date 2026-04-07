{
  description = "yash2k4's NixOS config";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.noctalia-qs.follows = "noctalia-qs";
    };

    noctalia-qs = {
      url = "github:noctalia-dev/noctalia-qs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

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
    noctalia,
    noctalia-qs,
    nixpkgs,
    nvf,
    self,
    spicetify-nix,
    stylix,
    ...
  } @ inputs: {
    nixosConfigurations.wrath = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = {
        inherit inputs;
      };

      modules = [
        ./nodes/wrath/configuration.nix

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
                ./nodes/wrath/home.nix
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
