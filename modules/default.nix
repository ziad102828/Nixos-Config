{ config, pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./networking.nix
    ./desktop.nix
    ./nvidia.nix
    ./users.nix
    ./packages.nix
    ./flatpak.nix
    ./virtualization.nix
  ];

 
  system.stateVersion = "25.11";

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
