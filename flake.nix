{
  description = "NixOS configuration with KDE Plasma, NVIDIA Optimus, and Flathub";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations.nixos = lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./hardware-configuration.nix
          ./modules

          home-manager.nixosModules.home-manager
          {
            home-manager.useUserPackages = true;
            home-manager.users.ziad = import ./home;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.backupFileExtension = "backup";
          }
        ];
      };

      homeConfigurations."ziad" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home ];
        extraSpecialArgs = { inherit inputs; };
      };
    };
}
