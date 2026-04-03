{
  description = "yash2k4's nixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
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

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    stylix,
    spicetify-nix,
    noctalia,
    noctalia-qs,
    nvf,
    ...
  } @ inputs: {
    nixosConfigurations.wrath = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        ./nodes/wrath/configuration.nix
        stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            backupFileExtension = "bak";
            extraSpecialArgs = {inherit inputs;};
            useGlobalPkgs = true;
            useUserPackages = true;
            users.yash2k4 = {
              imports = [
                ./nodes/wrath/home.nix
                spicetify-nix.homeManagerModules.default
                inputs.noctalia.homeModules.default
                nvf.homeManagerModules.default
              ];
            };
          };
        }
      ];
    };
  };
}
