{
  description = "SwayFX on NixOS";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix, spicetify-nix, ... }@inputs: {
    nixosConfigurations.nixro = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = { inherit inputs; };

      modules = [
        ./configuration.nix

        stylix.nixosModules.stylix

        home-manager.nixosModules.home-manager

        {
          home-manager = {
            backupFileExtension = "backup";
            extraSpecialArgs = { inherit inputs; };
            useGlobalPkgs = true;
            useUserPackages = true;

            users.yash2k4 = {
              imports = [
                ./home/home.nix
                spicetify-nix.homeManagerModules.default
              ];
            };
          };
        }
      ];
    };
  };
}
