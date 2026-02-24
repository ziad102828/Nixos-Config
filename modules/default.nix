{ config, pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./networking.nix
    ./desktop.nix
    ./nvidia.nix
    #./gaming
    ./users.nix
    ./packages.nix
    ./flatpak.nix
    ./docker
  ];

 
  system.stateVersion = "25.11";

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
