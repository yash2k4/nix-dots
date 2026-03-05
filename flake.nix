{
  description = "SwayFX on NixOS";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.nixro = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = { inherit inputs; };

      modules = [
        ./configuration.nix

        home-manager.nixosModules.home-manager

        {
          home-manager = {
            backupFileExtension = "backup";
            extraSpecialArgs = { inherit inputs; };
            useGlobalPkgs = true;
            useUserPackages = true;

            users.yash2k4 = import ./home.nix;
          };
        }
      ];
    };
  };
}
