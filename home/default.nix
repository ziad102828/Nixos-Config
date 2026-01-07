{ config, pkgs, ... }:

{
  imports = [
    ./gaming.nix
    ./programs.nix
    ./zsh.nix
    ./plasma.nix
    ./vscodium.nix
    ./git.nix
  ];

  home.username = "ziad";
  home.homeDirectory = "/home/ziad";

  home.stateVersion = "24.11"; 

  programs.home-manager.enable = true;
}
