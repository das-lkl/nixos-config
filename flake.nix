{
  description = "T14 Setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # KORREKTUR 1: zen-browser ist nun ein eigenständiger Input
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
    
    nixosConfigurations = {
      T14 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/T14/configuration.nix
          ./hosts/T14/hardware-configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users."lkl" = import ./home/user.nix;
            
            environment.systemPackages = [
              inputs.zen-browser.packages.${system}.default
            ];
          }
        ];
      };
    };
  };
}

# TO UPDATE:
# nix flake update 
# sudo nixos-rebuild switch --flake .#T14